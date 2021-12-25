local dap = require("dap")

dap.configurations.scala = {
  {
     type = "scala",
     request = "launch",
     name = "Run",
     metalsRunType = "run"
  },
  {
     type = "scala",
     request = "launch",
     name = "Test File",
     metalsRunType = "testFile"
  },
  {
     type = "scala",
     request = "launch",
     name = "Test Target",
     metalsRunType = "testTarget"
  }
}
