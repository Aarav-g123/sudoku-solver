open Tk

let main () =
  let top = openTk () in
  Wm.title_set top "OCaml Sudoku";

  let entries = Array.make_matrix 9 9 None in
  
  for r = 0 to 8 do
    for c = 0 to 8 do
      let e = Entry.create ~width:2 ~justify:`Center top in
      Grid.configure [e] ~row:r ~column:c;
      entries.(r).(c) <- Some e
    done
  done;

  let print_board () =
    for r = 0 to 8 do
      for c = 0 to 8 do
        match entries.(r).(c) with
        | Some e -> 
            let content = Entry.get e in
            if content <> "" then
              Printf.printf "Cell (%d, %d) contains: %s\n" r c content
        | None -> ()
      done
    done
  in

  let btn = Button.create ~text:"Solve" ~command:print_board top in
  Grid.configure [btn] ~row:9 ~column:0 ~columnspan:9;

  mainLoop ()

let () = main ()