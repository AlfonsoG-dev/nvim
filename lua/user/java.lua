local jdtls = require("jdtls")

-------------------------------------------------------------------
-- 1. Detect project root
-------------------------------------------------------------------
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == nil then
    return
end

-------------------------------------------------------------------
-- 2. Workspace directory (Windows compatible)
-------------------------------------------------------------------
-- Use USERPROFILE instead of HOME
local home = os.getenv("USERPROFILE") or os.getenv("HOME")

-- Use backslashes for Windows paths
local workspace_dir = home .. "\\AppData\\Local\\jdtls\\workspace\\" ..
vim.fn.fnamemodify(root_dir, ":p:h:t")

-------------------------------------------------------------------
-- 3. Correct path to jdtls installed by Mason
-------------------------------------------------------------------
local mason_path = vim.fn.stdpath("data") .. "\\mason\\packages\\jdtls"
local jdtls_cmd = mason_path .. "\\bin\\jdtls.bat"

-------------------------------------------------------------------
-- 4. jdtls configuration
-------------------------------------------------------------------
local config = {
    cmd = {
        jdtls_cmd,
        "-data", workspace_dir,
    },

    root_dir = root_dir,

    capabilities = require("cmp_nvim_lsp").default_capabilities(),

    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
        },
    },

    init_options = {
        bundles = {}, -- add Java debugger later
    },
}

-------------------------------------------------------------------
-- 5. Start or attach
-------------------------------------------------------------------
jdtls.start_or_attach(config)
