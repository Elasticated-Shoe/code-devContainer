# Dockerised Code Environment
My personal customisations ontop of [code server](https://github.com/coder/code-server).

## But Why?
Visual Studio Code supports a lot of remote development features. Which I've never, ever used. Its also an Electron app, plenty of which I have abandoned development countless times. [See more here](https://code.visualstudio.com/docs/devcontainers/containers)

What does this mean?

**You can host it in a container and access it in a browser. Any browser**.

For my everyday use of VSCode this is perfect: 
1. I don't have to configure an environment on my Windows PC, Dual boot laptop and work laptop
2. I can even use it on my tablet, or loaned PCs when I move about and it still has ooomph
3. It's the same environment, everywhere and everytime (I love you WSL but you are a timesink)
4. My environment is now defined as code

Of course, I don't use VSCode everyday. But maybe now I might. *Now there are fewer blockers*.

# Setup
These are steps you should run before attempting to build the docker image

## Create ssh keys
Create the directory for the keys to go:
```bash
mkdir ssh_keys
```

Run this command to generate ssh keys:
```bash
ssh-keygen -t rsa -q -f "./ssh_keys/id_rsa" -N ""
```

# Building the Docker Image
```bash
docker build -t code-environment .
```

# Run It
```bash
docker run -p 8080:8080 --name code-server code-environment
```

# Deploy it
Once built, you've got a docker image. Personally I just deploy it somewhere on my network with [Portainer](https://www.portainer.io/). But you can put it anywhere, even host it externally.

# Postscript
Yes, I am aware if I used Doom Emacs instead it would look cooler.