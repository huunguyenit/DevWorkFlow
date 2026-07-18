<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hoạch định công suất" e="DCRP Run"></title>

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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VqcAszXptjJqQxF78JkaxC9d2A+pJU3kaXaBWkHBI7Nthwe5SKQkYA9smst0OXq4A==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xFut3UFiUrAbxvQqYPMMrQPFCNskj2IxtTcZSWwPYd94eT+loypTYK0ABTbwK6REh6E55wkYmSODF5+7yCHnnX8ohGVES0Fop0RRoiOvMLUA==</Encrypted>]]>
    </text>
  </script>
</dir>