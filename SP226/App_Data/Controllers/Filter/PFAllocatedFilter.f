<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PFAllocated">
  <!ENTITY DetailTable "d73">
]>

<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sửa chi phí phân bổ" e="Edit Charge Amount"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã ncc" e="Supplier"></header>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ma_nt">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1" allowContain="true">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="268" anchor="4">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100"/>
      <item value="11010000000101: [ma_kh].Label, [ma_kh], [ten_kh%l], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1----------111: [stt_rec], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1: [&DetailTable;]"/>
      <categories>
        <category index="1" columns="769, 0, 0, 0" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E2IBxtzNri06ECzDkN8OCKziOnCVIKoRRTjwm4A9WU33NfrAI7Fy9P5Wn6ldkndvKJ2gsZLTp/fXmWzloTfvXU5ktwRiBXtC5rrZTokzoDpQU29ex60+1H8y6ZIGNTmAw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87n9hX24ef9KPD2joh5SG2oneRwC0O1UoGbRm9iQTjrQ+6CTsG5fvynCUEK37Ukt+m+CNcgtpiMbNxooMhUsLwvB3Cc8Vsc/w/ZNj3fOW7w+jm4/l0bbjk5pegB7I+RxGs0=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1EkX9Q9O0cl96f+rc5szlGkyZDZLLAaSsHNdweKBp8v4P+rtR0S/eo1yHBtLPxg7RWXghCyEFBR/mrqS7jKosgfG/x+VJl1hzmVlsesPkJNZ+8C/+nS0CVPVaCn8RHkw+cNExrKPEshaMOmm8CYIm54qnULIxh97+kRnbKpmh5P0+Wkx9krvzx4rVYa5ANNPZeyJ5pcarv/LhF6XuOwM218LOHrnRjwoAHGUb5cx9UfWQUKhjpvfhbClYsWMQLTGfj2ZBhuHIqItFdhNq1VCAMX</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2OAVZfDvKUy2vl2bHeGxzLQUZgDEU7N/OyAToq+4ayDt</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOKAWjqxOqvAVIHkCB33P6ojltr9nRNZ0PtiPhubxXbiZnTXKvOJnj9CLsiLpRksx/s=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKksqT9d+xZrn3zuRvtybB+0v71l8djLeflHM1dKCSmWX/UqBkGxLriFgqlSG/tft7yPfT37fIykVdj9HjMGNU+L+A/+IrZg36MO1NxwvXOqqpQWApypHq8+fVXFjF29nrBYFpa7AYZTff5/TWkBkqEMTWsOa19x++Q24rF443NJ5PZYC0J9fQkeeC454jCD13n/IMBKsBMdmecnLiQWvcvUsPOe6qtbJvKXIJeltkhy7OsygGQdkH+aehnNU+OMkVqC/yoGgiYlrVJMIxUSCS1Ph/+uoqYLjztM/3oEmbm5jKPMr0l2Q7VjYjqlPA6JfPaqyDKG+cKSSFElijZ+ZN/9UE4SbBlWkNAdxmk+ToLBlBEBndeORJNbCz8/SMeUjrylyKP107ZKeo1VxQLu6+FIpZ80aP/ItD8yF7EhYMmmEj26qPSdrJM5gFUnt2UZR3N8=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9KM6OybP5CpyGWXfoxGeQQcxGPHc+t44+H5P4OWJBRhBrgfoiddjSJ9UH2yuDvbLhGp1itDR+0YqH4Po0PmBUvg=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9J+krHha/ADCdghm7qtsXVAOwaXW9S5LwW3IKaNPHJU3Pt4Uvuixf7jzTkxeAMnEYrwQEkUEsP/gOd36KuGKnsxOlkAbExL0YLFji/Zb9sS6UcnXUBd41r1Ria714GKs/kmvTpq3MT7ss2rcwYd9RKuWY/Zy/rE96354KI/N7LRd/k3eCacca92pJBwCZeIFWIh8TLYWWGtEp63QouqnIWjXO4WCI+7mFUjEf2aOF3drnYWPzZVo0TLyOzy//1y2/e1HNirDHL7tFlYu/3UdAN3ug765xB5r5izQxsUiMprNo2pWQN8qVyg1ZrkWcYTFeld1SvNpntdXbblDeWBkXG9MSSGxtYAGazU3xn5yGP1N+AI49QAyD9Goy3+zR7GOEcmCXR7RhZgqsFPJOZ5/KQo0HLPGTwLe1TQBqdSF0tZHb/Dq2o9ULVrvqQ0zX8xTVBM3Qdx9MY5RCxvfQiK86S/9uQEYIpBy+juo7ICsqKEkmYPgoEpQGUnnS6aeE+/Zz8vHk+g/ZgpzElMZ7cZQnpsPf0akA3EZzqJfU+BJ+cWHPaOWJuG/Pl1Aa3muCS6UYZ3dvuDxgUh2mw1Cb8j3GeQ=</encrypted>]]>
    </text>
  </script>
</dir>
