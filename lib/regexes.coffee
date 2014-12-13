module.exports = 
  count: /how[ \t]+many[ \t]+(people|folks|explorers|adventurers)[ \t]+are[ \t]+in[ \t]+space([ \t]+right[ \t]+now)?/i
  names: /who('s|[ \t]+is)[ \t]+in[ \t]+space([ \t]+right[ \t]+now)?/i
  picture: /show[ \t]+me[ \t]+space[ \t]+explorer[ \t]+(.*?\S.*?)\s*$/i
  bio: /tell[ \t]+me[ \t]+about[ \t]+space[ \t]+explorer[ \t]+(.*?\S.*?)\s*$/i
  country: /where[ \t]+is[ \t]+space[ \t]+explorer[ \t]+(.*?\S.*?)[ \t]+from\b/i
  location: /where[ \t]+is[ \t]+space[ \t]+explorer[ \t]+(.*?\S.*?)[ \t]+stationed\b/i
  time: /how[ \t]+long[ \t]+has[ \t]+space[ \t]+explorer[ \t]+(.*?\S.*?)[ \t]+been[ \t]+in[ \t]+space\b/i
  total: /how[ \t]+many[ \t]+days[ \t]+has[ \t]+space[ \t]+explorer[ \t]+(.*?\S.*?)[ \t]+spent[ \t]+in[ \t]+space\b/i
