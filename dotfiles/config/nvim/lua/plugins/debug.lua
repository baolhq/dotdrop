return { -- Setup debuggers
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Required dependency for nvim-dap-ui
		"nvim-neotest/nvim-nio",

		-- Debug apdater
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		local map = function(keys, callback, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, function()
				callback()
			end, { desc = desc })
		end

		-- DAP keymaps
		map("<leader>ds", dap.continue, "Start/Continue")
		map("<leader>di", dap.step_into, "Step into")
		map("<leader>do", dap.step_over, "Step over")
		map("<leader>du", dap.step_out, "Step out")
		map("<leader>dt", dap.toggle_breakpoint, "Toggle breakpoint")

		-- Here we list out DAP to install
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"rust-analyzer",
			},
		})

		-- CodeLLDB is an open source debugger for C/C++ and Rust
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "/usr/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		-- DAP Configurations
		dap.configurations.rust = {
			{
				name = "Launch Rust",
				type = "codelldb",
				request = "launch",
				program = function()
					vim.cmd(":!cargo build")
					vim.api.nvim_feedkeys("<CR>", "n", false)

					-- Extract directory name to run
					local current_dir = vim.fn.getcwd()
					local dir_name = current_dir:match("[^/]+$")
					return current_dir .. "/target/debug/" .. dir_name
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.3 },
						{ id = "breakpoints", size = 0.2 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 0.25,
					position = "right",
				},
				{
					elements = {
						{ id = "relp", size = 0.45 },
						{ id = "console", size = 0.55 },
					},
					size = 0.25,
					position = "bottom",
				},
			},
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				enabled = true,
				-- Display controls in this element
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
				},
			},
		})

		vim.keymap.set("n", "<leader>dU", dapui.toggle, { desc = "Toggle UI" })

		-- Change breakpoint icons
		vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
		vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
		local breakpoint_icons = vim.g.have_nerd_font
				and {
					Breakpoint = "",
					BreakpointCondition = "",
					BreakpointRejected = "",
					LogPoint = "",
					Stopped = "",
				}
			or {
				Breakpoint = "●",
				BreakpointCondition = "⊜",
				BreakpointRejected = "⊘",
				LogPoint = "◆",
				Stopped = "⭔",
			}
		for type, icon in pairs(breakpoint_icons) do
			local tp = "Dap" .. type
			local hl = (type == "Stopped") and "DapStop" or "DapBreak"
			vim.fn.sign_define(tp, { text = icon, texthl = hl })
		end

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
