#!/bin/bash

# Atualiza a lista de pacotes
#echo "Atualizando a lista de pacotes..."
#sudo apt update

menu(){
    echo " ██████╗ █████╗ ███╗   ██╗██╗██╗   ██╗███████╗████████╗███████╗    ███████╗██╗   ██╗██╗ ██████╗ ██████╗ "
    echo "██╔════╝██╔══██╗████╗  ██║██║██║   ██║██╔════╝╚══██╔══╝██╔════╝    ██╔════╝██║   ██║██║██╔════╝██╔═══██╗"
    echo "██║     ███████║██╔██╗ ██║██║██║   ██║█████╗     ██║   █████╗      ███████╗██║   ██║██║██║     ██║   ██║"
    echo "██║     ██╔══██║██║╚██╗██║██║╚██╗ ██╔╝██╔══╝     ██║   ██╔══╝      ╚════██║██║   ██║██║██║     ██║   ██║"
    echo "╚██████╗██║  ██║██║ ╚████║██║ ╚████╔╝ ███████╗   ██║   ███████╗    ███████║╚██████╔╝██║╚██████╗╚██████╔╝"
    echo " ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝  ╚══════╝   ╚═╝   ╚══════╝    ╚══════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚═════╝ "
    echo "" 
}
menu
# Função para exibir ajuda
mostrar_ajuda() {
    echo "Uso: $0 [opções]"
    echo
    echo "Opções:"
    echo "  --git          Instalar Git"
    echo "  --curl         Instalar Curl"
    echo "  --vim          Instalar Vim"
    echo "  --htop         Instalar Htop"
    echo "  --build-essential  Instalar Build-essential"
    echo "  --docker       Instalar Docker"
    echo "  --nodejs       Instalar Node.js e npm"
    echo "  --python       Instalar Python3 e pip"
    echo "  --nmap         Instalar Nmap"
    echo "  --gobuster     Instalar Gobuster"
    echo "  --Hydra        Instalar Hydra"
    echo "  --dirb         Instalar Dirb"
    echo "  --ffuf         Instalar ffuf"
    echo "  --nuclei       Instalar Nuclei"
    echo "  --all          Instalar todas as ferramentas acima"
    echo "  --help         Mostrar esta ajuda"
}

# Verifica se nenhum parâmetro foi passado
if [ $# -eq 0 ]; then
    mostrar_ajuda
    exit 1
fi

# Variáveis para controle de instalação
INSTALAR_GIT=false
INSTALAR_CURL=false
INSTALAR_VIM=false
INSTALAR_HTOP=false
INSTALAR_BUILD_ESSENTIAL=false
INSTALAR_DOCKER=false
INSTALAR_NODEJS=false
INSTALAR_PYTHON=false
INSTALAR_NMAP=false
INSTALAR_GOBUSTER=false
INSTALAR_HYDRA=false
INSTALAR_DIRB=false
INSTALAR_FFUF=false
INSTALAR_NUCLEI=false

# Processa os argumentos
for arg in "$@"
do
    case $arg in
        --git)
        INSTALAR_GIT=true
        shift
        ;;
        --curl)
        INSTALAR_CURL=true
        shift
        ;;
        --vim)
        INSTALAR_VIM=true
        shift
        ;;
        --htop)
        INSTALAR_HTOP=true
        shift
        ;;
        --build-essential)
        INSTALAR_BUILD_ESSENTIAL=true
        shift
        ;;
        --docker)
        INSTALAR_DOCKER=true
        shift
        ;;
        --nodejs)
        INSTALAR_NODEJS=true
        shift
        ;;
        --python)
        INSTALAR_PYTHON=true
        shift
        ;;
	--nmap)
        INSTALAR_NMAP=true
        shift
        ;;
	--gobuster)
        INSTALAR_GOBUSTER=true
        shift
        ;;
	--hydra)
        INSTALAR_HYDRA=true
        shift
        ;;
	--dirb)
        INSTALAR_DIRB=true
        shift
        ;;
	--ffuf)
        INSTALAR_FFUF=true
        shift
        ;;
	--nuclei)
        INSTALAR_NUCLEI=true
        shift
        ;;
        --all)
        INSTALAR_GIT=true
        INSTALAR_CURL=true
        INSTALAR_VIM=true
        INSTALAR_HTOP=true
        INSTALAR_BUILD_ESSENTIAL=true
        INSTALAR_DOCKER=true
        INSTALAR_NODEJS=true
        INSTALAR_PYTHON=true
	INSTALAR_NMAP=true 
	INSTALAR_GOBUSTER=true 
	INSTALAR_HYDRA=true 
	INSTALAR_DIRB=true 
	INSTALAR_FFUF=true 
	INSTALAR_NUCLEI=true
        shift
        ;;
        --help)
        mostrar_ajuda
        exit 0
        ;;
        *)
        echo "Opção inválida: $arg"
        mostrar_ajuda
        exit 1
        ;;
    esac
done

# Instalação das ferramentas conforme os parâmetros
if [ "$INSTALAR_GIT" = true ]; then
    #menu
    echo "Instalando Git..."
    sudo apt install -y git
fi

if [ "$INSTALAR_CURL" = true ]; then
    #menu    
    echo "Instalando Curl..."
    sudo apt install -y curl
fi

if [ "$INSTALAR_VIM" = true ]; then
    #menu
    echo "Instalando Vim..."
    sudo apt install -y vim
fi

if [ "$INSTALAR_HTOP" = true ]; then
    #menu
    echo "Instalando Htop..."
    sudo apt install -y htop
fi

if [ "$INSTALAR_BUILD_ESSENTIAL" = true ]; then
    #menu
    echo "Instalando Build-essential..."
    sudo apt install -y build-essential
fi

if [ "$INSTALAR_DOCKER" = true ]; then
    #menu
    echo "Instalando dependências do Docker..."
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    echo "Adicionando chave GPG do Docker..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    echo "Adicionando repositório Docker..."
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    echo "Atualizando lista de pacotes novamente..."
    sudo apt update
    echo "Instalando Docker..."
    sudo apt install -y docker-ce
fi

if [ "$INSTALAR_NODEJS" = true ]; then
    #menu
    echo "Baixando setup do Node.js..."
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    echo "Instalando Node.js e npm..."
    sudo apt install -y nodejs
fi

if [ "$INSTALAR_PYTHON" = true ]; then
    #menu
    echo "Instalando Python3 e pip..."
    sudo apt install -y python3 python3-pip
fi
if [ "$INSTALAR_NMAP" = true ]; then
    #menu
    echo "Instalando nmap..."
    sudo apt install -y nmap
fi
if [ "$INSTALAR_GOBUSTER" = true ]; then
    #menu
    echo "Instalando Gobuster"
    sudo apt install -y gobuster
fi
if [ "$INSTALAR_HYDRA" = true ]; then
    #menu
    echo "Instalando Hydra"
    sudo apt install -y hydra
fi
if [ "$INSTALAR_DIRB" = true ]; then
    #menu
    echo "Instalando Dirb"
    sudo apt install -y dirb
fi
if [ "$INSTALAR_NUCLEI" = true ]; then
    #menu
    echo "Instalando Nuclei"
    sudo apt install -y nuclei
fi
if [ "$INSTALAR_FFUF" = true ]; then
    #menu
    echo "Instalando Ffuf"
    sudo apt install -y ffuf
fi
# Limpeza
echo "Removendo pacotes desnecessários..."
sudo apt autoremove -y

echo "Instalação concluída!"
