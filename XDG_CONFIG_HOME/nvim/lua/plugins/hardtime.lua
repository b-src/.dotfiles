return {
   "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
   opts = {
     enabled = true,
     -- bump this to account for 'jk' -> <Esc> mapping
     max_count = 3,
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
