<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hoạch định năng lực sản xuất" e="RCCP Run"></title>

  <fields>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hoạch định" e="Planning Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 50, 350"/>
      <item value="110: [ngay_hd].Label, [ngay_hd]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Wjy8YKydj1JTxiKL+ACyng+O4nCD1zDPLsd/Cz9LMJ0foJNawzAxBOdoQQT00pjKQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xFut3UFiUrAbxvQqYPMMrQPFCNskj2IxtTcZSWwPYd94eT+loypTYK0ABTbwK6REh6E55wkYmSODF5+7yCHnnX8ohGVES0Fop0RRoiOvMLUA==</Encrypted>]]>
    </text>
  </script>
</dir>