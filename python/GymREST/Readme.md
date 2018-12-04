# Gym HTTP Instructions

## Build Steps
Build agent image via `docker build -t rl_gym_agent_001 -f Dockerfile.agent .`

Build server image via `docker build -t rl_gym_server_001 -f Dockerfile.server .`

## Execution Steps
Run Gym server via
`docker run -it -p 5000:5000 --name rl_server --privileged=true rl_gym_server_002`
or if you want to run it in the background:
`docker run -d -p 5000:5000 --name rl_server --privileged=true rl_gym_server_002`

Run agent container and link it to server
`docker run -it --link rl_server rl_gym_agent_001 bash`
Afterwards, execute `python3 new_agent.py` to run the agent against the environment. 