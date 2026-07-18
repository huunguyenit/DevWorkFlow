<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lưu trữ đơn hàng kế hoạch" e="Planning Order Backup Version"></title>
  <fields>
    <field name="code" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Phiên bản" e="Version"></header>
      <items style="AutoComplete" controller="MPSVersionList" reference="name%l" key="status = '1' and loai = '1'" check="1=1 and loai = '1'"/>
    </field>
    <field name="name%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="check_yn" type="Boolean" defaultValue="false" inactivate="true">
      <header v="" e=""></header>
      <footer v="Ghi đè" e="Override Existing Version"></footer>
      <items style="CheckBox"/>
    </field>
    <field name="type" type="Decimal" clientDefault="1">
      <header v="Loại" e="Type"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Lưu trữ đơn hàng kế hoạch" e="Backup"/>
        </item>
        <item value="2">
          <text v="Xóa lưu trữ đơn hàng kế hoạch" e="Delete"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZf5gVWcuSQxUdnn35BZAIPd5WqQuFDuFjA3L1Josu5vTnsOF+5CLs2HxJ654sM8UFA==</encrypted>]]></clientScript>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 50, 20, 220, 130"/>
      <item value="110010: [code].Label, [code], [name%l]"/>
      <item value="11000-: [type].Label, [type]"/>
      <item value="-1100-: [check_yn], [check_yn].Description"/>
    </view>
  </views>

  <commands>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ecSFdsnOHZbZ7BjKYw95cLGVAs9Yy9Z7NTPgjat/lSEFablojk9YX07lN4ws7Khn/cUzBdyJ8PPgVkJ+WJ1OaGW6onPObNUH7WgIP4wI3XT+X9PvaLKmfuHWR0ucCZRC7iQ5sANzxc51TG8p5m6yOXAaoEkFxllbSgQd351xfCy4AWpCYRn8TtjJBN0rGRg5KliPYCyJNV61dLMtKvBk1+e1APLidQ1VGYvyyR8wVItXsjXbGbHyyYrzrkoSD/r3mSLRkzCv0hJch0OKghU4TXwtxq9b6Juz3GEG/TJM3l2M781gjOdayKutm7FvUc1EoN24KdXulr/d3dhZd9MQDp4YhFJYwAkjDU2+hPfn+Rshx1zmdQx8GuxsQGkV3rYR7QWKh6XGvNhMawYo7cxAKna4WECYzfSzEUpqkPpOH0c0dOCQWEpcwX1iOar9SMCpzQ2FbE235j5nJLgfhoCte53FjxsNekwnDsq6V8XH2+0G9DsfWzxRIq/9NlQtxvV3oqvDXfrH3VyHGP/7aCnPw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KcCh58IJwrFKWH4ieU3gZlvANIOSufp677bM3/TBLqRCwAgqgFTM5U/rgTe94y//k5ZDQ5Qqz4QVxPvFDSXSGR6F8Mrcv85dLfKizS5Z85TpeavswUFRspl0AqJToOds1EwmXpL+EMaaZzPlRmipUZaIiMsuMz4ZXcl4IqP5+KHIxKL/GAZ80XVGcxq/PPDFA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>