<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identification "hrptMultiPeriodLaborFluctuationByDept">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % Graph SYSTEM "..\Include\Graph.ent">
  %Graph;

  <!ENTITY GraphTitle.v "Bảng tổng hợp tăng giảm lao động theo bộ phận nhiều kỳ: &#37;s1 - &#37;s2">
  <!ENTITY GraphTitle.e "Multi Period Labor Fluctuation Report: &#37;s1 - &#37;s2">
  <!ENTITY GraphTitleField.v "['sysRow', 'sysRowName']">
  <!ENTITY GraphTitleField.e "['sysRow', 'sysRowName']">
  <!ENTITY GraphDataField "['so_nv_bq', 'so_nv_ct', 'so_nv_ta', 'so_nv_ng']">
  <!ENTITY GraphDataIndex "[-1]">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bảng tổng hợp tăng giảm lao động theo bộ phận nhiều kỳ" e="Multi Period Labor Fluctuation Report"></title>
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