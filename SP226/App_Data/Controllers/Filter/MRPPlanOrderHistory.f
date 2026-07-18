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
      <items style="AutoComplete" controller="MPSVersionList" reference="name%l" key="status = '1' and loai = '2'" check="1=1 and loai = '2'"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ecSFdsnOHZbZ7BjKYw95cLGVAs9Yy9Z7NTPgjat/lS0LHNhlDUi1e+Y4eGk0u+m5F4aYruaR7Lc770ldYSUe7H3AxnLbG6nglc4JoIzbIsgIFHsaRS9YUOSsjNdLHvh3Q6L069MQOIwgxUAhqgtt9n/PsEqCaZS/JIHJDhpQVg7BVgBErDpwsDnCG/poFDlsFyORzrEYQLeN8mcPO0qBqpIwQARUq9SRHmmXRMIsyy0ABJBHnb/mS9S4BD5zGoDXBX52ncAYbx/Q8aTH4jxrON/PLbWPcgCUu9yQRl8RfkhqVi2ZxTwVgOS2+uZAcrOEKSKS41sB43erqMuEXjthThCNEHrGvq0wChCVYu90UbGMyoCY7VvI8VOUrgcvKhHjdwF8tUNYJ/Q1tWXedInMuTieXUi8UK3qs37DT60lYFGlJL+Jm5Gha695KEGfndfxxlRGb+9VhDcQXtEmvdRoq1GlCb2t+1srcZtPyGyfLd+co9zh2cRoFRIibQbkYr9sDD1WN1RTYHUB4asw1A1NY=</encrypted>]]>
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