let () =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_create@.";
  let instance_id = Gym_http.env_create "CartPole-v0" in
  begin match instance_id with
  | Some instance_id -> Format.printf "%s@." instance_id
  | None -> Format.printf "%s@."  "Error: env_create"
  end

let () =
  Format.printf "-------------------------------@.";
  Format.printf "Test env_list_all@.";
  let envs = Gym_http.env_list_all () in
  begin match envs with
  | Some envs ->
      List.iter
        (fun (instance_id, env_id) ->
           Format.printf "  %s: %s@." instance_id env_id)
        envs
  | None -> Format.printf "%s@."  "Error: env_create"
  end
