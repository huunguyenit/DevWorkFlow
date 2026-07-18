<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>
<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kqf5ohATGd9HXbQQ2MtDF58akBR6+VqzmakD4623WyEj838Zi1gvibgu063Iv0WF74vBdJ1aDBk+TAWccIXRfw6J5/ErUCsSQ7hiSAo0nimcP+rE4L+i8HWroAOPiwV+wA==</encrypted>]]>&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJyg4SWzyIhg5CPEagHXg+u5E1YSBBQR5MaUbEH+vH7xUCNBQforSefOuTng0UKyOlfsvpSrzQ/4nVrg88a+znIgdorkMg4PwFkClBoaIgtr8ojd84IVWm+SUSKQl+Fa27qdCVQuYguxfyVCkxFYvdQz5gpk74ICksrVwIqUrB+ECLjKlzRRHxLsWBV3SjC3u6+uQnzSNdumtY+3y0f3EUdYeN7GrQ0CoaE5HeklFHAueV9c5OCkWd0Rd5efJL69auCZ4I02PRVLZIZhTauOtmYpt0pJxxyX2NDRfIZ3sVKvAXQPxlpxYMfDsddZyh8ZLo4jaPMwn82fY9+M6z06pMaBCvFPZlatWFgX7NKtGTZIB2IimkSOdqyf2GzU9ExYwmiV+NcQzn6rDn7k3Hv0Xkk1pXuOs/OCgQAzm8tJtPdrdvmp0D20ZHSNW2vkzNCfvZVr9jtJo3FBpo011ZzpmubO6KU2Pjc7wnEMIIGYBJnwy1Fb32OumrPfZLmE31M7cW0Orp6hjci9MA1tWZDEbL1441I0ppqzAjyIDhD6pVtji12yN0eStbTvzMH2rFcekA8HA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>