## The states for the run are:
# QUEUED
# READY
# PREPARING
# INITIALIZING
# PLANNING
# FINISHED

package spacelift

webhook[wbdata] {
  endpoint := input.webhook_endpoints[_]
  endpoint.id == "discord"

  input.run_updated.run.type == "TRACKED"
  input.run_updated.run.state == "FINISHED"

  wbdata := {
  	"endpoint_id": endpoint.id,
    "payload": {
    	"embeds": [{
          "title": "SPACELIFT RUN FINISHED!",
          "url": sprintf("https://YOUR_APP_DOMAIN.app.spacelift.io/stack/%s/run/%s", [input.run_updated.stack.id, input.run_updated.run.id]),
          "description": sprintf("**## Run Info** **Stack**: %s\n**Run ID**: %s\n**Run Author**: %s\n**State**: %s\n\n**## Commit Info** **Commit**: [%s](%s)\n**Branch**: %s\n**Message**: %s\n**Commit Author**: %s", [input.run_updated.stack.id, input.run_updated.run.id, input.run_updated.run.creator_session.login, input.run_updated.run.state, input.run_updated.stack.tracked_commit.hash, input.run_updated.stack.tracked_commit.url, input.run_updated.stack.branch, input.run_updated.stack.tracked_commit.message, input.run_updated.stack.tracked_commit.author]),
          "color": 8060672,
        }
      ],
    }
  }
}

sample { true }
