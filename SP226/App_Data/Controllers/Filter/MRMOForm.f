<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "MRMO">
  <!ENTITY DetailTable "ctsx">
  <!ENTITY c21 "Số lsx">
  <!ENTITY c22 "MO Number">
  <!ENTITY c31 "Ngày lsx">
  <!ENTITY c32 "MO Date">

]>

<dir table="phsx" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lệnh sản xuất" e="Manufacturing Order"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="&c21;" e="&c22;"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="&c31;" e="&c32;"></header>
    </field>
    <field name="ngay_ct2" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="232" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_ct2, ngay_ct" e="String: ngay_ct2, ngay_ct"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_dvcs, ma_dvcs" e="String: ma_dvcs, ma_dvcs"></text>
        </item>
      </items>
    </field>

  </fields>

  <views>
    <view id="Dir" height="292" anchor="5" split="6">
      <item value="100, 100, 237, 100, 0, 8, 58, 50, 100, 0"/>
      <item value="11110-1011: [ngay_ct].Label, [ngay_ct], [stt_rec], [ngay_ct2], [so_ct].Label, [so_ct], [ma_dvcs]"/>
      <item value="1: [&DetailTable;]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9JZdL8G59SoqzF05WfH5ag3lD1kBuCu8cHL4UhzuH7Pg9Lwi/dmQyl3ihzhHR2f2/DP1R13oHuTO8c5lCP0yGOEUzCa4ZnFfDrbXoauxxw4mk+tHgg9/lU3nM87zPjPnig==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87lxdFI8JeKgtlPwSXTCx2Ttmias7EFgcwnnSElVQsBcKw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1GoQKPexK7ncn6ClfzHS6azHpHHD+m77bo7A341x6DaOPwSPKQ6C0HIRNCJ9CRnASY3nu7Ki6o+huvFGAJqt+5KN1F1Z3BUJzkcD8HaKpe1rg0zBbt8FUookDhjEkEKmAcOxFIOFxGof6o2tGki1CV2s/lk+wv+s0jn0WU+SiZRlt+LjQitNYlOAFE6Y6MNdBgNUSbB1QAlARdcmP92eYM95MnaVtj5rtCUstLTc1c12+qg2ZtmpmisSYqw6uwJVbLrtSxNCbuUIUydOgjhpLAAIEP4tc5XXzAwU8P4fOp0EQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2OAVZfDvKUy2vl2bHeGxzLQUZgDEU7N/OyAToq+4ayDt</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOKAWjqxOqvAVIHkCB33P6ojltr9nRNZ0PtiPhubxXbiZnTXKvOJnj9CLsiLpRksx/s=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKkvEOhbrnzwwEkdScw5cZzFP/v6GyBKazTd0g6IAvnPEqw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ks+cMykz6XumP0keQrCD4hzsQkjisIYT356Vb+iXb29M0AJ8sWY0MX+zfYlvbDcbpNd98AO+czbvKCdaVB5aNQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+dq1j+IhkYuRlSLXpy0ZH6jRi6vXz8Wy+zq4UjXEGvC+WNhzyDQa7lrdGvrgm/43pqbrKAB4Vvqxed/DXUpL0XjQsYUppZN14BbGL5cXEfCY0Qtk9wzQHKuxGT/is7BVLq6m1jZwqLcSYrQDpemx/9kidgYC8MIOlF02fD7nynmRtzwNyouABuIxV4i9pDXPUzzIrR9ikuxw4hm9DPxrp52TbH9poJXHl5P5p7pXYHiaO/lhLwm/chVppT7fWH0B82IxQf7PtRwWqFHG9oIqXyBUOt/RsGba0OsVTc2COWH8=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%QFirECjU/RgLQ4k5nc6GM2LD+aIDIko9ADdorcZ1Y49UuvScGj5+qwPr7EO4ron9l6XJMJ21YzS3JHCvQgciThhANUTYRFLofX/eO2h+DbeCWSBCH5Y+AfDNl83hZhxCbMO2BMVcSPqKpojx1XnDKIWNPSmuQ6c+TPhIobfWPl0WujhRmxI2ltgQOo1gn6rt5MNYlWeGGfmTEslUVUas2yM8GKG7Tt3KqN+znC003lt5qjzKXTqNd0hRrD0qySwjjn1LkCgAZivPFC816BQWdYY/yu3kl9g4g1NYsDDtQrCR7zC9Tco/IHIU+2dH328Nkv4iM760jQMCZTKOgobP5UumgpUYqErv1EkMOW8EerhKx6+H6JwQjnU5AMKwFNoiiH+bsISeU+dEdbtTvwiv7hovwmHhhwCNfczCby8Ktf4/ojfdruUR1Z9ODRAAbO4Gypg+mpVSY8iN0BSVkYeY3iVYZe6ahvcDv39H1MEbCFQ=</encrypted>]]>
    </text>
  </script>
</dir>
