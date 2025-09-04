{
  programs.nixvim.keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options.desc = "Find Files";
    }
    {
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options.desc = "Live Grep";
    }
    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options.desc = "Find Buffers";
    }
    {
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      options.desc = "Find Help";
    }
    {
      key = "<leader>e";
      action = "<cmd>Oil<CR>";
      options.desc = "Open File Explorer";
    }
    {
      mode = "n";
      key = "K";
      action = "lua vim.lsp.buf.hover()";
      options.desc = "LSP Hover";
    }
    {
      mode = "n";
      key = "gd";
      action = "lua vim.lsp.buf.definition()";
      options.desc = "Go to Definition";
    }
    {
      mode = "n";
      key = "gr";
      action = "lua vim.lsp.buf.references()";
      options.desc = "Go to References";
    }
    {
      key = "<leader>ca";
      action = "lua vim.lsp.buf.code_action()";
      options.desc = "Code Action";
    }
    {
      key = "<leader>rn";
      action = "lua vim.lsp.buf.rename()";
      options.desc = "Rename Symbol";
    }
    {
      key = "[d";
      action = "lua vim.diagnostic.goto_prev()";
      options.desc = "Previous Diagnostic";
    }
    {
      key = "]d";
      action = "lua vim.diagnostic.goto_next()";
      options.desc = "Next Diagnostic";
    }
    {
      key = "<leader>dl";
      action = "lua vim.diagnostic.open_float()";
      options.desc = "Line Diagnostics";
    }
    {
      key = "<leader>db";
      action = "lua require('dap').toggle_breakpoint()";
      options.desc = "Toggle Breakpoint";
    }
    {
      key = "<leader>dc";
      action = "lua require('dap').continue()";
      options.desc = "Debug Continue";
    }
    {
      key = "<leader>do";
      action = "lua require('dap').step_over()";
      options.desc = "Debug Step Over";
    }
    {
      key = "<leader>di";
      action = "lua require('dap').step_into()";
      options.desc = "Debug Step Into";
    }
    {
      key = "<leader>dO";
      action = "lua require('dap').step_out()";
      options.desc = "Debug Step Out";
    }
    {
      key = "<leader>dr";
      action = "lua require('dap').repl.open()";
      options.desc = "Debug Open REPL";
    }
    {
      mode = "n";
      key = "<leader>mi";
      action = "<cmd>MoltenInit<CR>";
      options = {
        silent = true;
        desc = "Molten: Initialize Plugin";
      };
    }
    {
      mode = "n";
      key = "<leader>ml";
      action = "<cmd>MoltenEvaluateLine<CR>";
      options = {
        silent = true;
        desc = "Molten: Evaluate Line";
      };
    }
    {
      mode = "n";
      key = "<leader>mr";
      action = "<cmd>MoltenReevaluateCell<CR>";
      options = {
        silent = true;
        desc = "Molten: Re-evaluate Cell";
      };
    }
    {
      mode = "v";
      key = "<leader>m";
      action = "<cmd><C-u>MoltenEvaluateVisual<CR>gv";
      options = {
        silent = true;
        desc = "Molten: Evaluate Visual Selection";
      };
    }
    {
      mode = "n";
      key = "<leader>me";
      action = "<cmd>MoltenEvaluateOperator<CR>";
      options = {
        silent = true;
        desc = "Molten: Evaluate with Operator";
      };
    }
    {
      key = "<leader>/";
      action = "gcc";
      options.desc = "Toggle current line comment";
    }
    {
      mode = "v";
      key = "<leader>/";
      action = "gc";
      options.desc = "Toggle comment for selection";
    }
  ];
}
