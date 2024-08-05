local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  post_hook = function(ctx)
    if ctx.range.srow == ctx.range.erow then
      -- do something with the current line
    else
      -- do something with lines range
    end
  end,
})
