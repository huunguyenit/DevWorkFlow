<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="hrpnbp" code="ma_pn" order="ma_pn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ma_loai" allowNulls="false">
      <header v="Loại phân nhóm" e="Category Type"></header>
      <items style="AutoComplete" controller="hrDeptCategoryType" reference="ten_loai%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="110100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIr3se/OLLONhID52eBbyymBDTzhiuW0Q878HKBqQOEGZFiVZh+meKvma+RY/roHTCxeBjm9QCWLbr4o/ovz6d4IxUgcBQuGmzwu0vbboCWP1WW6HihR9lVLO2VZma8UE+yAfifhlpoyhKFFPc7oE9IzrlLGvPpZ18y1vq96EYQjI2QyW5hAxrvMShmTjjTSxltMjTgYdlRG4GKzBHpHhzJO6TXm7bfBKdfISLVoH1nNJRT5yyVlae4fBjpehhs3sONUs8QhLd1yGwTWKMXwdAYFEOV1IAEhraLkMvS38U/2GdP78UAZIb2zhKK5vx6uX/+pjDdC9rg7l0SEd4ZNo4gpTctdQqwOcwzvTAAPP8cTfFP220BX1Lnh8VcM+9wJUGPPbM5zBlONkd6B3oRHe+hG8rW3zVs51V6MUP7WC06O6fHa+nj0mmuLEas1BHYj7gvMJua9uUNGIjg2tPrOSTZ/jAY/JUl/2etg6qWJ3n82gw==</encrypted>]]>
    </text>
  </script>
</dir>