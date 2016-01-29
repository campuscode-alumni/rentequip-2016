var price_calculation = function(){
  if($('#contract_tool_ids').val() != '' && $('#contract_term').val() != ''){
    var result = [];
    $.each(prices,function(index, obj){
      $.each($('#contract_tool_ids option:selected'), function(i, tool){
        // TODO: trocar deadline por term
        if(obj.tools_group_id == $(tool).data('tools-group-id') && obj.deadline == $('#contract_term').val()){
          result.push(obj.price);
        }
      });
    });
    if(result.length > 0){
      var total_price = result.reduce(function(previousValue, currentValue, index, array) {
        return parseFloat(previousValue) + parseFloat(currentValue);
      });
      $('#contract_total_price').val('R$ ' + Number(total_price).formatMoney(2, ',', '.'));
    } else {
      $('#contract_total_price').val("");
    }
  }
}

$(document).ready(function(){
  $('#contract_tool_ids').change(price_calculation);
  $('#contract_term').change(price_calculation);
});

Number.prototype.formatMoney = function(c, d, t){
var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};
