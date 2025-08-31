{ pkgs, ... }:

{
  # Kubernetes and container management tools
  # Use case: Cloud-native development and operations
  
  home.packages = with pkgs; [
    # Core Kubernetes tools
    unstable.kubectl
    unstable.kubectl-ktop
    unstable.kubectx
    kubelogin
    kubelogin-oidc
    unstable.krew
    unstable.kustomize
    unstable.kubernetes-helm
    
    # Development and testing
    unstable.kind
    unstable.k9s
    unstable.stern
    unstable.k6
    
    # Security and compliance
    unstable.kube-linter
    unstable.kubeconform
    unstable.sonobuoy
    
    # Container tools
    unstable.dive
    unstable.crane
    unstable.docker-client
    
    # Infrastructure as Code
    unstable.opentofu
    
    # Platform-specific tools
    unstable.openshift
    unstable.kubeone
    unstable.talosctl
    unstable.cilium-cli
    unstable.fluxcd
  ];
}
