<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="mpdh" cache="true" code="ma_vt, ma_kho, ma_kh, ngay_yc" order="ma_vt, ma_kho, ma_kh, ngay_yc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>
  <fields>
    <field name="ngay_yc1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày yêu cầu từ" e="Require Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Require Date from/to"></footer>
    </field>
    <field name="ngay_yc2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày yêu cầu đến" e="Require Date to"></header>
    </field>

    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0' and status = '1'" check="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0' " information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="kh_yn = 1 and status = '1'" check="kh_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="111: [ngay_yc1].Description, [ngay_yc1], [ngay_yc2]"/>
      <item value="1110: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1110: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1110: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKwRLasfmkanC87YtpusIJD3jXDCm5LulcQlvkbPGuQhg2hWtLu/HbRNU8YV301wLHHeYstXwdqFXnSfd8d1SPRG7gf80S42do7nsrSWVAjEkq7w7PakIyiDIhS3Rj0OL6orEyxNAJMP1/251rJsAH80N64PBFlKKsTItS3E6cJlQTB5eimAPBO9l4H114iQEWzVvAmBAIgQA1SgNBxLKx1W3m37ZHSOqArqPIH+XcU+hvjME4cCD75WUYtg/PCLWOkyHUqQIpvRovqHg/whbMTXoK/KNYcH3rOPw7TrjP0ITWmVar0fzhCuD+rO3pIK5Uw0wgjqBV1lmR5f6Nk5xwL+rqAvofjZQWRwDhtBNJLijK+Lqs/dW1zz9ZBl/eJn449495Ub1dG/5NcA/UdzO/1sMnEHlzCoxeYLIh3Zga6XFJl8gKxgBCUPNW+/d4JAYMMwhZZCEnwa4CXXAvnIC/3UehCly0hTJC0RwijF4Rqspgo4ETgyfISicDXHRIhwVktxNMQEfg/YCiDGeIYtIP9t</Encrypted>]]>
    </text>
  </script>
</dir>