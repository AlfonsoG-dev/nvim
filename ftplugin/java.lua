local jdtls = require("jdtls")

-- Detect project root
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

-- Workspace directory
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Path to your JDTLS installation
local jdtls_path = "D:/Descargas/instalador/java/jdlts/bin/jdtls.bat"


local config = {
  cmd = {
    jdtls_path,
    "-data", workspace_dir,
  },
  settings = {
      java = {
          saveActions = {
              organizeImports = false,   -- ❌ disable import organization
          },
          completion = {
              importOrder = {},          -- ❌ no import order enforced
          },
          project = {
              sourcePaths = { "src" }
          }
      }
  },
  root_dir = root_dir,
}

jdtls.start_or_attach(config)
