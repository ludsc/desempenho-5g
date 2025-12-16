Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "3072"
    vb.cpus = "2"
  end
  
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    
    # Ferramentas essenciais
    apt install -y \
      curl wget git net-tools iperf3 \
      tcpdump htop ca-certificates \
      software-properties-common
    
    # Podman
    apt install -y podman podman-compose
    
    # Docker (se ainda quiser)
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker vagrant
    
    # Docker Compose
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    
    echo "✅ Todas ferramentas instaladas."
    echo "🐳 Docker: $(docker --version 2>/dev/null || echo 'Não instalado')"
    echo "📦 Podman: $(podman --version 2>/dev/null || echo 'Não instalado')"
    echo "🔧 iperf3: $(iperf3 --version 2>/dev/null || echo 'Não instalado')"
  SHELL
end

