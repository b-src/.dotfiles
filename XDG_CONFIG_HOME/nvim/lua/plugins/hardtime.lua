return {
   "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
   opts = {
     enabled = true,
   },
   event = "VeryLazy",
   keys = {
     {
       "<leader>th",
        function()
          require('hardtime').toggle()
        end,
       desc = '[T]oggle [H]ardtime',
     },
   },
}
