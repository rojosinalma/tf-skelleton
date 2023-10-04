package spacelift

webhook[wbdata] {
  endpoint := input.webhook_endpoints[_]
  endpoint.id == "discord"

  #input.run_updated.stack.type == "TRACKED"
  input.run_updated.stack.state == "FINISHED"

  wbdata := {
  	"endpoint_id": endpoint.id,
    "payload": {
    	"embeds": [{
          "title": "SPACELIFT RUN FINISHED!",
          "url": sprintf("%s", [input.run_updated.run.commit.url]),
          "description": sprintf("**## Commit Info** **Stack**: %s\n**Branch**: %s\n**Commit**: %s\n**Message**: %s\n**Commit Author**: %s\n\n**## Run Info** **ID**: %s\n**Run Author**: %s\n**State**: %s",[input.run_updated.stack.id, input.run_updated.stack.branch, input.run_updated.stack.tracked_commit.hash, input.run_updated.stack.tracked_commit.message, input.run_updated.stack.tracked_commit.author, input.run_updated.run.id, input.run_updated.run.creator_session.login, input.run_updated.run.state]),
          "color": "23eb2d",
        }
      ],
    }
  }
}

sample { true }
