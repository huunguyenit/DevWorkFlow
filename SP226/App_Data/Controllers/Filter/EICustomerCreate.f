<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="khhddt" code="ma_kh" order="ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khai báo danh sách khách hàng" e="Retrieve Data from Customer list"></title>
  <fields>
    <field name="ma_dvcs" onDemand="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="Lookup" controller="Customer" key="status = '1' and not exists(select ma_kh from khhddt b where dmkh.ma_kh = b.ma_kh) and e_mail &lt;&gt; ''" check="not exists(select ma_kh from khhddt b where dmkh.ma_kh = b.ma_kh) and e_mail &lt;&gt; ''"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11000-: [ma_kh].Label, [ma_kh]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    <command event ="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbQWm6b6Po0ikxMuOQ7/vNuAvZQYG5VkHdti1qSv4fFHQAm0snBHprHfWGGzertHrdg15uv2wEC1ELbd2QLhprFlePWeqNYKylht3fzXfIHD1LhI3mrDFEiqQvMuZQAqnAzh6opgThMw8ttgtR5hoviQJgzEicHkY2R2qks7dErjPAGh7bN8Q7G9Z2Hls0SJ1WgmxXKUjDlCk7rMYwdWiHTZ5TXCN/iLsiokymXHmzvxnbUgRQMN7SjexcwJyyNMQ18sr1FaL8v62bMxrAH0lazFajzIe/1P+5QRCplgH8867HHi5eygzeS2+WIRWz/sTnQRNmlhYx/foJrNoDnW/rcVWFXmtyGLxPm5yHpS6tRX9rGKzzO/Z2BogXFf+mXyD7yd0ldiHdJbGxFCaSKWMzdPWC9KyltM4uIdL+IksoUe//GfBdskrpGIFdWzeVrGKg36BDJYR4j3ibLIsrG3yfJ7kT5VOwgz7ba/iKBs4Ldw6Y2H4bscEX0bcp4efRxrUXLmTuxGDXGUHu8j4vE8U9b/7Xd2hfMYIHCvIohS+TRhbrebIGsMcqlSfa1bWaNqqIW8xL/HUJNzA5lVoFRTbBNp9g3YM+F3knOEu2QBxvRtqAXJ0q/LfLJ9QjhU6FCPTUkIKJCS6vhX8lL1LVEVFWsCpA8eRo4zJTBJH68/hhHbgDmVY+LulUmpmyDgbU2FuBooau/WF0s6Mkd1HXTokZ+6</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY7Imv+2nbuKplrky6bCdNfZ9RQkHEp9lGP8gxsHXwMYMgFIL3hwQCDWbud24Cfl/YeOea7Qa8CfZ3usLkTVqwvvwbG3HD26+W8AnJHiQ9SnV1t7oLESQg0nUqObjoEWKA</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>