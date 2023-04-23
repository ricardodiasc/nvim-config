-- This location is where depending on the filetype, this code wil execute. Make it easy to load only when on java code.
--
local status, jdtls = pcall(require, "jdtls")

if (not status) then
  print("jdtls not installed")
  return
end


local JDTLS_LOCATION = vim.fn.stdpath "data" .. "/mason/packages/jdtls"

-- print(JDTLS_LOCATION)

local HOME = os.getenv("HOME")

local WORKSPACE_PATH = HOME .. "/workspace/java"


-- Only for Linux and Mac
local SYSTEM = "linux"
if vim.fn.has "mac" == 1 then
  SYSTEM = "mac"
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }

local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == "" then
  print("Debug propose: Java root not found")
  return
end


jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
local extendedClientCapabilities = jdtls.extendedClientCapabilities;


local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dsgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(JDTLS_LOCATION .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    JDTLS_LOCATION .. "/config_" .. SYSTEM,
    "-data",
    workspace_dir,
  },

  root_dir = root_dir,

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaJDK-11",
            path =  HOME .. "/.sdkman/candidates/java/11.0.19-tem",
          },
          {
            name = "JavaJDK-17",
            path = HOME .. "/.sdkman/candidates/java/17.0.7-tem",
          },
          {
            name = "JavaJDK-19",
            path = HOME .. "/.sdkman/candidates/java/19-tem",
          },
          {
            name = "JavaJDK-20",
            path = HOME .. "/.sdkman/candidates/java/20-tem",
          }
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationscodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enable = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        settings = {
          url = "/home/ricardo/.local/share/eclipse/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
    },
  },
  signatureHelp = { enable = true },
  completion = {
    favoriteStaticMembers = {
      "org.hamcrest.MatcherAssert.assertThat",
      "org.hamcrest.Matchers.*",
      "org.hamcrest.CoreMatchers.*",
      "org.junit.jupiter.api.Assertions.*",
      "java.util.Objects.requireNonNull",
      "java.util.Objects.requireNonNullElse",
      "org.mockito.Mockito.*",
    },
  },
  contentProvider = { preferred = "fernflower" },
  extendedClientCapabilities = extendedClientCapabilities,
  sources = {
    organizeImports = {
      starThreshold = 9999,
      staticStarThreshold = 9999,
    },
  },

  codeGeneration = {
    toString = {
      template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
    },
    useBlocks = true,
  },

  flags = {
    allow_incremental_sync = true,
  },

  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)

-- require("jdtls.setup").add_commands()

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
