<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultTable "gltcpt01">
  <!ENTITY defaultForm "gltcpt01">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="periodFrom" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodTo" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearTo" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))" check="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))"/>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111: [periodTo].Description, [periodTo], [yearTo]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [form].Label, [form]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRWaPi/k0UKc31v6z1oVf+r6JkJX2vZ9KqqJ8kQU/cewq6F4+8PzO1XrTQ/yhZlg1C4hkHI+LNaKc2HtsF73/Rm+uLTWklw1luWT0KVGN9qckGAwHcz2Vf0IhG8AvNKGtaiZPQP/ZnLJTnUpi0jJezKjOv2fAOtTJ31VamkT5geSSf/C6cDlL25/moSSVL50/VFts+BZvbUxVwFbxWl7b2fw=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%aFAbyVXPX5GjVk6SkpZgUSh7H+W23t9yJtcKtjQs8+Rrb6ZYk2PQfk9TLTi30gfjNNz9z3z9aDHvnhBdHzOny+RRwgILNl7TqzEHoPiCPgZCy88NlN1Q20y3gSJt9ZHT9OqvLLYFjULcbz/daSGkws2eDe74lvS5VjZBgQuBeu8C1qmC2qdbxIPLM3rkWgZHkfHXE9lm/QDTAQCrJox+kXQZ7Iu7kTJ5W4tkug/qUpjHeYLlRCmuNqQrUfxjbxK1</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6hi7T1ny4weJQnWNqodF/ayFWQQx1Fg5db956cQvTwfWXUnn0ENORnP+JxPflIDXgzXp21smX8vJ3G9cbq1KG766Pzuyo1+sq4m6+XcTVyxh27w4gvOaVBHNZq593Ee1w==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf0MictEdXToHQ0E4W8oewIarO8tkd+cnaf0VRBuyYP9huqJazsM+uN5fvoKmwuTaTyB56aD0/twsncgv3pNFDGOaXarTr/VKvAaw/6cmiV3aoFCXXQVPBMF/GYxw5IW94SefULYLo33G9yvJUQMxHVLfXMBuuOqPVVTOIvg/+Fir</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtePBcmCdsU+Wd5rQyDmZH6E62AYtdIu9ePLHTowy3oXDKJjtioHYJTBaFqP6DqcA4VTuPE2jcHae/SAre7SFaaQ2f+2iuyM2oMOJKQj/t3KcPE4BBLuLV339VjR4o8Dii2LLw0wUtsizY4h5smzuVausw9hYe4ImpPfJT5Aw0jzeDidatYTyUDKlC3IOcAHSkNIH+7Sf8RozxuegEtQkly2OlFGDGhdfHp9w22qE6S4J9kVEdQAEX27wP7ChtcFEVsuZSuXuAEjsS+j1Gi/OLQSmG7AaZVE9Jwkz2eSni25CtuklpgFqtWFVjD1HMIppaDapgTR8y2oH/2MxRhVHFyHghYETDfggPGoyfyN4HvErn4lL4GoVVGI29w+QjHiEb9oAIoGcvEUM4xNg713668aIcQ6L0B1qx6KS/fIubIcOEfgwgkn7LPe8GV59v+e9QmoU4dz0by3lm8NZJEQt3nYnZ4THI9RBThoipMF8ruzjFDK+lwrMPwJ4GRiDBFouL6iF9xGXlR0PlMWRM+fPR9fXTseGpCuXp0YOjP/9fCoEOPSeO9WfSyzOdWrQOZ+TESD5FyWeHsFZecompx1bCWmKh1HodZv28hTdKSEMybQMEwvj8cf9EFSj98GPRQjav46ssJQSiH+Z9WPGHcmPVMKD+jI/5CzYfS2R0VhEz1wIhMxWtm5FFW8+VBQ74Lgn5iPyrUC4ltZs2GL/jZ4QBD2wV0a2I/w1LBbuIolEVRQ+2zFoAEJnxhT8rwgppYe5gQR6FTTfvDLBKsMI6ftiHc7FE2R5Xv5wyX7FU+g7ny4zIerexivJPr0Y4Yj92ykkjFdwDy2nGLWxWoozgHOnyANJtD/zkUXnT2oO1vOroqb0A==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>