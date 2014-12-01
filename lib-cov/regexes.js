if (typeof _$jscoverage === 'undefined') _$jscoverage = {};
if ((typeof global !== 'undefined') && (typeof global._$jscoverage === 'undefined')) {
    global._$jscoverage = _$jscoverage
} else if ((typeof window !== 'undefined') && (typeof window._$jscoverage === 'undefined')) {
    window._$jscoverage = _$jscoverage
}
if (! _$jscoverage["regexes.coffee"]) {
    _$jscoverage["regexes.coffee"] = [];
    _$jscoverage["regexes.coffee"][1] = 0;
}

_$jscoverage["regexes.coffee"].source = ["module.exports = ", "  count: /how[ \\t]+many[ \\t]+(people|folks|explorers|adventurers)[ \\t]+are[ \\t]+in[ \\t]+space([ \\t]+right[ \\t]+now)?/i", "  names: /who('s|[ \\t]+is)[ \\t]+in[ \\t]+space([ \\t]+right[ \\t]+now)?/i", "  picture: /show[ \\t]+me[ \\t]+(.*?\\S.*?)\\s*$/i", "  bio: /tell[ \\t]+me[ \\t]+about[ \\t]+(.*?\\S.*?)\\s*$/i", "  country: /where[ \\t]+is[ \\t]+(.*?\\S.*?)[ \\t]+from\\b/i", "  location: /where[ \\t]+is[ \\t]+(.*?\\S.*?)[ \\t]+stationed\\b/i", ""];

(function() {
  _$jscoverage["regexes.coffee"][1]++;

  module.exports = {
    count: /how[ \t]+many[ \t]+(people|folks|explorers|adventurers)[ \t]+are[ \t]+in[ \t]+space([ \t]+right[ \t]+now)?/i,
    names: /who('s|[ \t]+is)[ \t]+in[ \t]+space([ \t]+right[ \t]+now)?/i,
    picture: /show[ \t]+me[ \t]+(.*?\S.*?)\s*$/i,
    bio: /tell[ \t]+me[ \t]+about[ \t]+(.*?\S.*?)\s*$/i,
    country: /where[ \t]+is[ \t]+(.*?\S.*?)[ \t]+from\b/i,
    location: /where[ \t]+is[ \t]+(.*?\S.*?)[ \t]+stationed\b/i
  };

}).call(this);
