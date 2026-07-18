<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="m43$000000" code="stt_rec" id="PT0" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir" cache="true">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="ma_kh" filterSource="master" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
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
          <text v="Phiếu thu - hóa đơn" e="Cash Receipt - Invoice"/>
        </item>
        <item value="2">
          <text v="Hóa đơn - phiếu thu" e="Invoice - Cash Receipt"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cPFwSWq3m6z57B0rggjEYn2SWAN8edbFWENnWQuoThRW2o+nOYhTFyg9IsqARA8Ntz+Z1uoYf6SRJvqERF7OeJF/7GGH7Xe9yEKPeE1PuOIiLqoBg7UmKLe00ypiFt5lUNHXQfqcFZyHxoK8tfhYuqtbpkIUs3fE4jAnJ4252KUwWd/RgR6l14ru4pcQ5WcAFVowm85f7Yt+wOiii8zhY8cDPV3mzGeOyBeppTr9KIqTKaHxBftdcynqTdoBECChUndj8w96X/uJFNRQQfXqBJdq+2F5cTgD0Uj6m4+QdpENtaTCF2T8sBt0sCcL0SEC9tViFu67WzNDvhFjZ2b9FngeveGVaDCtrkVkh5xk1Cx</encrypted>]]>
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