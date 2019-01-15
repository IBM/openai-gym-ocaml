# OCaml binding to openai-gym

openai-gym-ocaml is an OCaml binding for [openai-gym](https://github.com/openai/gym) open-source library. It is built as a client for the [gym-http-api](https://github.com/openai/gym-http-api) REST API.


## Quick install with Opam

The easiest way to install openai-gym-ocaml is through the Opam
package manager for OCaml.  Instructions to install Opam on you system
can be found on the website: <http://opam.ocaml.org/doc/Install.html>.

Then you can install openai-gym-ocaml with the following command:
```
opam install openai-gym
```

To use the openai-gym package, you need to have a [gym-http-api](https://github.com/openai/gym-http-api) server runnung:
```
python3 gym_http_server.py
```


## Tutorial

In order to illustrate the use of openai-gym-ocaml, we are going to
program a random controler for cart-pole environment. It is going to
use the `openai-gym` package and its type definitions:

```ocaml
open Openai_gym
open Gym_t
```

We create a new environment that our agent is going to interact with.
```ocaml
let instance_id =
  Gym_client.env_create "CartPole-v1"
```

We initialize the environment.
```ocaml
let init =
  Gym_client.env_reset instance_id
```

We now create an agent that ignore the observation of the environment
and just select a random action:
```ocaml
let random_agent _obs =
  (* sample a random action in the action space of the instance *)
  Gym_client.env_action_space_sample instance_id
```

Now that we have an environment, and an agent, we can create a simulation
loop that executable the agent in interaction with the environment
until the environment says `done`.
```ocaml
let rec simu obs =
  let action = random_agent obs in
  let resp = Gym_client.env_step instance_id action true in
  if resp.step_done = true then ()
  else simu resp.step_observation
```

We can finally launch the simulation and close the environment when it
is finished.

```ocaml
let () =
  simu init.observation;
  Gym_client.env_close instance_id
```

To compile this program, we need to link the `openai-gym`. Using
`ocamlfind` the command is:

```
ocamlfind ocamlc -linkpkg -package openai-gym tutorial.ml
```

Before executing the program, we have to launch a
[gym-http-api](https://github.com/openai/gym-http-api) server:
```
python3 gym_http_server.py
```
