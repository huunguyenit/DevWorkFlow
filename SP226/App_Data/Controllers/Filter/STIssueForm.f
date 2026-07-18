<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "STIssue">
  <!ENTITY DetailTable "d66">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Voucher Number">
  <!ENTITY c31 "Ngày phiếu xuất">
  <!ENTITY c32 "Voucher Date">

]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu xuất bán" e="Sales Issue"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+egQXooM/rEveam5B4fAna4apUh+s0sx/BuPysK4P0wwCRe5QT2dq+JHXUEozEIEgBVAI8GWrTHK1dT+eAJopvCRSAizbl3ZgiflY54kN1lPIfWrGKm41y07X+OYBG/3K08wmjczZCJjNggeJ0YcKAstVwsxIJuE7QvB5oSRffWNKsou19qukiV1PTYSQTkCL7bX32JGwFtaLp++G3pUdg8Y7ME8feRfQNquizNHoAlLgYfdjpFwfNn1aMDZ2YBbFI1VYf7tKjrabteuHvpTIoW/nJp/wApdcdzqCKeiXzbqYGul61VF9b4mmqaSv71Azn9q36cpHVPOiFJYGcv+tiJHH6unAdnTe63sDtra0eUeCY7eKxyDq2MEN14oZAHX/</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7Ye0LSQQ3B98oAyYa6qXmxq8e9t49yO9rb8ERus0yhK2O3jE5rhpPW1SezaUGuo5sdprFE+osA6m3h0F2PrIrZeD6InEYxHtXDvBF9oQ1IA9q2GFMyF+zKg4aa0OKZCKn2ziPzKmELM3HfLhMhWAESl74xLdwj/+SQTCG8Go7xWm3VKIc8wLRmSpx1VV61LGDv9goVEzQUTgtysgv2GVB3G0YPjxRcL9e/Kk/SBYpPFVyuWISFruyZaSj94lfRKwUgi3kC4Md4n6il3M035I5IOc362IaQ6u7Fn+om2NW5BTn7UpkdFf3xvbCaTadJ3i8VB7gyRwBRVvdv83rgEilFjw/Yk1U6LidOAJBxPHVLpTa8siQpt7qkryyuwKBuF4fn0lkXNdf2OA9gI9g0ghIsYRS3MwS9ZSZ3VNAt+bFLunySa9h/QdCnNe9aAmjmOdzRNWRjWVqUCyUsB4TxAPxx0kCNw5c2LMBaxt1iXMmdpQZr1lfWX6H/pK5pbu2BXTIXQTPhoQUPwIPWA7eGQVI6HfjTtbyy4EEf3G1w1dCJfh3OR7U/ASCMZL9Z+xBDUngWEUl1+WQdi5/FWLQ2klZvbR+ACFW0J3UmsJgDWRv3Rxw6SK2SY4+H+tUCMDuI+WA59F2cwPp0uncNmrAjH6TaQA</encrypted>]]>
    </text>
  </script>
</dir>