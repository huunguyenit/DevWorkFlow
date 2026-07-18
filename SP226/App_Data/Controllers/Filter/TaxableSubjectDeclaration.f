<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="dmkbtmt" code="loai, ma_vt, ngay_hl" order="loai, ma_vt, ngay_hl" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai" type="Byte" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Nhập khẩu, 2 - Bán hàng" e="1 - Purchase, 2 - Sales"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_vt">
      <header v="Vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hiệu lực từ từ" e="Effective Date from from"></header>
      <footer v="Ngày hiệu lực từ" e="Effective Date from"></footer>
    </field>
    <field name="ngay_hl2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hiệu lực từ đến" e="Effective Date from to"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101-: [ngay_hl1].Description, [ngay_hl1], [ngay_hl2]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPzBiuKLRs5Q7NwA7H/cv3VDxl27oRLKzE8axR3I+5dzTPXLnqPx8XmfiFsWRMqMTSgAuAuHnAUacdZ5cM3fAI3omp+ZAEz5eLtDCYvjqoSAcKWG6hR9EGg9mo+64+mgD0cBmlP55JDsRgATH23wnorlevvWL7Ou/2ArqKodAzLcd00EKkRWt2Tffu2HuCyJytIjYPCDfz2ww77NQ8DUGevWCcJijyZIzVohXbsHu7EbBT/Cmy1MUuQ2bDhp+O0W1rZR5DE0AIOxOfjNwmP77UH2glYooFJh2ZAreZu1SnJ4YTztRY7eSafLcgEXdKzUzyFmftaMKyz/J/O9VsH91jpNnJo6Jm6ECW4SFHBfWBABrC6c/0BiVfreZNsAE8Sm4QQAbGxUyJJ3bWRW139wHod774p19qYo9le7jWDCt8I5grX4mdFfjShSfnyAhZnb7jO5LbsMBLlNiHUkKSz/LavYScb1Rn8W9KpfE2bB5v7biD7oPkfnpWeqxfBI6/XRB9q3Va2DrNJa+Ipbxs+84ZlQ==</Encrypted>]]>
    </text>
  </script>
</dir>