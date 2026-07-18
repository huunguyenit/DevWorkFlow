<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A0592\ReportCircularTypeField.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="thang" type="Int16" dataFormatString="#0">
      <header v="Tháng" e="Month"/>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PdsIcPP2rG4l3ZaCtXNtL8+Q9Q4sfazKIbKVREcNP7wNjZJEBsGcMebog9WGkcF+Q==</Encrypted>]]></clientScript>
    </field>
    <field name="quy" dataFormatString="0, 1, 2, 3, 4" clientDefault="Default" defaultValue="0" align="right" maxLength="1">
      <header v="Quý" e="Quarter"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PdsIcPP2rG4l3ZaCtXNtL8+Q9Q4sfazKIbKVREcNP7wNjZJEBsGcMebog9WGkcF+Q==</Encrypted>]]></clientScript>
    </field>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="##0">
      <header v="Lần bổ sung" e="Additional Times"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="TaxDepartment" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    &ReportCircularTypeField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [thang].Label, [thang]"/>
      <item value="11: [quy].Label, [quy]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11: [bo_sung].Label, [bo_sung]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu915G/uFfMhKU1mrhkb67t2ATbNpsGMJ75/0ON5FlH1AsqMLKqr4c7sc3Jl8qo8LHci7DRQUo+kVKf548Q6sShPYnxwPGyDMmQSsl5aIEJLBQzNAYxBgB03twy3gZFWvFNMVRWcclRxGcRjuT2+A+JNBQgU9SmaWtFQWtJqUjAfmOMEPHz8Eh9DnuCzMOvzSVdg9dZ969oQswA2+ZdY9H2othFeHtPHsr2iZJvG50eYHl0QW4afBAb0ABQfWudSrbTl+yiDW7VGsurCkWRNAQe4=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkDov1cHj5PI6sEEw0XuZcC/587zZrg4TgM5lFxW5FHe8QnWHLYg2Bqj0kEQZKAVsQssyEeLvGBV0XpgPUm2BpMLXuti4oUfZrYsSzPlRw8jHEnE4X57XoG3Nj3JeoM91oobB61J1rVWZTk0s/ynb+RHRv/m2v121UgtEHqwB9hhh5qlodTub0ywwytqRWkXjRHbYIuPQ58syMJyviROud5NWze7703YvvtX6Ir1fwE4FTUYOlOgdTAJmHMrz9sULa7dL/kN9xynOkb8x665IRHgqJp05Koumbl+IDDTGYxQcw/HzI8t3gwjLExHEeZ6pM9ahcUFEeEUMMDlDAQskh5Q</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KznAxcIswTJ+m3tywBw/ZROm+YkGbc0zPRCHC2Tb3hooR5yeiGATxD7FtDb1byuiSzSPlwCm+5q+b1FF3BEPzzr6ggU2JKvm3vjZ6Y8sV96VTTyp7tBTLB3y0zuc6VSoWkQP4zlbhCp9FpaDVEQ9qqbR7g8GVMhEIioqrP3P6AvboPC/L53b32BbyEpAcBfXISTdJOpOGI42fBArzZHYvn28BuTizWR45RWvIaCig652PKdvRcvU3bgKnWRjyEShzkZ1KVXlhOJAHExGw+obcirsfHUH/fLEM352DIFcjvowUqfxS+EYAmhwMTX0JDQhu7AXzrJGsfAX6U2uT+6Ij1QKt6pErY9EMitmTThINU3dZ0kL/Ej1oxO1hugogNxeDTrYn5yqXrXMrClUnduzHq2KuULl3fVYJ02xjOOSE/aGskqeod8bSqi5phDsKYQOEI1udmijTQ9x6AbHp8SlBnmXlo+F3mZbHcvcFLN3tBlzjBEs5/yBbJhJggc1wdy1JKeoaVvQfmguu9ueuvkWEmmVG6H9sPQdjT41xJikCDMcKbtVrbH0XqX8WAoYroNvpnbVuhvyuIFHuUekcSvhf7bo/W2qO98uG6hPw0K0rLIukdjCsER9VOcXghPEJZOXuwP+3QupNHSTo1+yKR+eUTpTcGgHC3gF6vNf7z47oVWAz18iAZxNIcswhXqodrOgVInB3M7zzG+drh64EQqxgrQgX+AUlH0bcmA6RBsUTSXddSZd09g6OIrh7ORDsSixS62IJQln7+mjJ9iNJITQ9RJPBSCXFdY88aWeSLY0bnao+ryhnY8ZxkpwfRPCK+dQrIXNIN9z2Jf1tro+n0Wb+ZPtDKeG477U0ymdemx0Qw4pTlOYZRKdMNIQNdIwdobKnXZm1HRq3kJx9ppo/3gWePQMtNUJ/WbjU36QeTYexkeP29BI4c5ANenh1Jm9S/w9hOVcSWGP9XY38hfjn77UoBNdsUbJJ5a5T3ZHAsjO3W7O0/tKakwGdUJ9CLLT7Ewa/0A==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>