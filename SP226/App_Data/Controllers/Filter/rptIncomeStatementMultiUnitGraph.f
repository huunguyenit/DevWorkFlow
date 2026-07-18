<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identification "rptIncomeStatementMultiUnit">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % Graph SYSTEM "..\Include\Graph.ent">
  %Graph;

  <!ENTITY GraphTitle.v "Báo cáo kết quả hoạt động sản xuất kinh doanh theo đơn vị cơ sở, mã số: &#37;s1">
  <!ENTITY GraphTitle.e "Multi-unit Income Statement, Number: &#37;s1">
  <!ENTITY GraphTitleField.v "['ma_so']">
  <!ENTITY GraphTitleField.e "['ma_so']">
  <!ENTITY GraphDataField "['tien', 'tien_nt']">
  <!ENTITY GraphDataIndex "[-1]">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Báo cáo kết quả hoạt động sản xuất kinh doanh theo đơn vị cơ sở" e="Multi-unit Income Statement"></title>
  <fields>
    &GraphFields;
  </fields>

  <views>
    &GraphViews;
  </views>

  <commands>
    &GraphCommands;
  </commands>

  <script>
    <text>
      &GraphScript;
      &OutlineEntry;
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzxgX4jLMXCAe9HW37raDZDq4CjBlYaRNRjZ7LuRuXFut+DbhiyTMmx3hRBkmZqxoX4G5fDP+JMvlHp6q/9BYLw=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&/9XKFIvbF45gsd2A6RZniD84fbud+pC7+BCFD9fmDFWskuCSpA3z64+39feGH9y4GwBzEgjcZrW1JwHcXc4IQA==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&z+NB3Ak5tR9dZDqIA7QrJZG1Obif5IPxe4HPy9drkZDPk+nI+5WLlqm8WhrvoE90IAhtcG7+Tk26Tx/ALFTXnRF7XBMPKK2/kx/nlWamEkI3Ybi98TWKYVH43D5Rq46TPRSQ7EKM2JHVkxoVA4L3WfbnhVLClUk0sd/PsvoxBGQ=</Encrypted>]]>
      &GraphStyle;
    </text>
  </css>
</dir>