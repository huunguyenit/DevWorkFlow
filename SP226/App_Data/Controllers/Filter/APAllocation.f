<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="m53$000000" code="stt_rec" id="PC0" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir" cache="true">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="ma_kh" filterSource="master" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZc8ug0nqJzSc0eFOE+A+FGfeO9P1lQATnXswAUtsLYZ3rLHFleLwbh5h+PUjG6h+rQ==</encrypted>]]></clientScript>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" allowNulls="false" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" inactivate="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_nt" filterSource="detail" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="view_type" clientDefault="1">
      <header v="Kiểu hiển thị" e="View Type"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Phiếu chi - hóa đơn" e="Cash Disbursement - Invoice"/>
        </item>
        <item value="2">
          <text v="Hóa đơn - phiếu chi" e="Invoice - Cash Disbursement"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 100, 100, 100, 130, 0"/>
      <item value="11: [ngay_ct].Label, [ngay_ct]"/>
      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1100-1: [view_type].Label, [view_type], [dia_chi]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRdq+JMvaYUwdjDYqWqhq0Psa8lSOgdCWg4ABX+dy2vJtUe9OMWhPLuljBJMYCKtxp82QvV4izZtfNBWPnuCbIkhs6txx84373fJVUVyj04hD15TkKfagvATcMgeAtbJ6p/dqRnHK4RNp050sAYDpfLc7KiFkXurAU31B/nJpNFYC9gr+UIEJHqpqm/OwWbqt/XyaJNbS+XX4JJLnueHhCoaT0+tbuRSf6ZrhOGWXYV10+A1sLZ/k/bwjShnsHXZUyIHIKD+awW/+wQEBmKG3o0GjMhVHPUoSFfLjcmkOxbV1LSY82Mmt6W69P2s+F6Bz2Pf+lMoaDlTLI4Ak6ozuCscRMm+RwAVic6Y+XSPcOLpT1MPQGB9xCWhqXG4GIHIhgcomsru03Zi60Rga7fg2+guIoL+2CNcuzktKIyNdaUnxIvVynU9zDvUU1/VCdlBh9xFynEmqziBVn0yOSq1smUmoUbVIkyZJ0Ska6pG2X8PbBFGzsdrK0ctBQjQyZZIQ==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1knDQUw0B7bvwvaApV6TauU4uPG1HgDJyvrvAmCzpoqmXRPKt2G/hTDxZUbMB3+osqU/4qDirDLtUHT/Mgk4Kk=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxiWn1XwMbwyyITpd53qAFyd3ImRgwTEWKQAcxFA6d7fLra6xXkvqIu+WBpu/hSAkkFW+aBn/TstvKJCqJMF1t0=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+ENSilbHeabHsqfe6JuUGwTwA5zJFZdvUJuii5ZYLKTSiqo2jU8aN9I52Ot89RCEStDwQEETVUIvM5RcDE8Uq03OQFblHzWc0v6apIh4gY8MC/0v6M2HuhTfvItohJlmP8gdnV8TEiy2CiHPtL8eKco0uQQ6dxM6Hsc0gKhjkKXLLEu7O8ugq1BEg3y1tHJbA=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cPFwSWq3m6z57B0rggjEYn2SWAN8edbFWENnWQuoThRW2o+nOYhTFyg9IsqARA8Ntz+Z1uoYf6SRJvqERF7OeJF/7GGH7Xe9yEKPeE1PuOIiLqoBg7UmKLe00ypiFt5lUNHXQfqcFZyHxoK8tfhYuqtbpkIUs3fE4jAnJ4252KUwWd/RgR6l14ru4pcQ5WcAFVowm85f7Yt+wOiii8zhY8cDPV3mzGeOyBeppTr9KIqTKaHxBftdcynqTdoBECChR9dT+449OUjfg/Hvh/JkVS7xQOZ89PJBgXXTHTA5YM2R6cHTDRuyjAqByvT/kyBsPWy8PX0hdoGInV3nHCDo8y3vO9o//RyjNc2cUSL3ZjT</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%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</encrypted>]]>
      &OutlineEntry;
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6nzGK75Llp07MPUHdLwLi7/uRP6QTMf+h3EnSUDznfo3VHFCxCjGi2CspVfAU6nwIdi4YjVEwIQOCl9UQ1K1FkkeizGxYWHkEvvJXRvh1p/w==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>