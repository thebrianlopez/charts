# installing Cilium

### Delete VPC CNI (aws-node DaemonSet)

```kubectl -n kube-system delete daemonset aws-node```

### Deploy Cilium

#### Add helm repo

```helm repo add cilium https://helm.cilium.io/```
```helm repo update```

#### Deploy cilium by helm

```helm install cilium cilium/cilium -f values.yaml --namespace kube-system```

#### Restart unmanaged pods 

```kubectl get pods --all-namespaces -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name,HOSTNETWORK:.spec.hostNetwork --no-headers=true | grep '<none>' | awk '{print "-n "$1" "$2}' | xargs -L 1 -r kubectl delete pod```

### Test Cilium

#### Deploy the connectivity test

```kubectl create ns cilium-test```

```kubectl apply -n cilium-test -f https://raw.githubusercontent.com/cilium/cilium/v1.9/examples/kubernetes/connectivity-check/connectivity-check.yaml```

The above deploys a series of deployments that will use connectivity paths to connect to each other. The pod name indicates the connectivity variant and the readiness and liveness gate indicates success or failure of the test:

``` bash
$ kubectl get pods -n cilium-test
NAME                                                     READY   STATUS    RESTARTS   AGE
echo-a-76c5d9bd76-q8d99                                  1/1     Running   0          66s
echo-b-795c4b4f76-9wrrx                                  1/1     Running   0          66s
echo-b-host-6b7fc94b7c-xtsff                             1/1     Running   0          66s
host-to-b-multi-node-clusterip-85476cd779-bpg4b          1/1     Running   0          66s
host-to-b-multi-node-headless-dc6c44cb5-8jdz8            1/1     Running   0          65s
pod-to-a-79546bc469-rl2qq                                1/1     Running   0          66s
pod-to-a-allowed-cnp-58b7f7fb8f-lkq7p                    1/1     Running   0          66s
pod-to-a-denied-cnp-6967cb6f7f-7h9fn                     1/1     Running   0          66s
pod-to-b-intra-node-nodeport-9b487cf89-6ptrt             1/1     Running   0          65s
pod-to-b-multi-node-clusterip-7db5dfdcf7-jkjpw           1/1     Running   0          66s
pod-to-b-multi-node-headless-7d44b85d69-mtscc            1/1     Running   0          66s
pod-to-b-multi-node-nodeport-7ffc76db7c-rrw82            1/1     Running   0          65s
pod-to-external-1111-d56f47579-d79dz                     1/1     Running   0          66s
pod-to-external-fqdn-allow-google-cnp-78986f4bcf-btjn7   1/1     Running   0          66s
```