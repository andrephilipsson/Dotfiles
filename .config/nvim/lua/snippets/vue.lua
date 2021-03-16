local indent = require'snippets.utils'.match_indentation

-- Extend the html snippets
local vue = require'snippets.html'

vue.new = [[
<template>
  $0
</template>

<script>
export default {}
</script>
]]

return vue
