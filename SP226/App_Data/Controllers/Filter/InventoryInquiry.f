<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "InventoryInquiry">
  <!ENTITY c1 "&lt;div id=&quot;&Identity;&quot; class=&quot;&Identity;&quot; align=&quot;center&quot; onclick=&quot;refresh$InquiryForm$(this);&quot;&gt;">
  <!ENTITY c2 "&lt;/div&gt;">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tra cứu tồn kho vật tư" e="Inventory Inquiry"></title>
  <fields>
    <field name="ma_vt" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <footer v="&c1;Làm tươi...&c2;" e="&c1;Refresh...&c2;"/>
    </field>
    <field name="ten_vt%l">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>

    <field name="d1" external="true" readOnly="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="&Identity;Detail" row="1"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="268" anchor="5">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101-: [ma_vt].Label, [ma_vt], [ma_vt].Description"/>
      <item value="11000: [ten_vt%l].Label, [ten_vt%l]"/>

      <item value="1: [d1]"/>

      <categories>
        <category index="1" columns="566" anchor="1">
          <header v="Chi tiết" e="Details"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1uI/LCLO16RHfPfwIkIPBzltyB2C1Ds9KabDbXGBviot8ueyDbTEuRRfGym1t7rBT31tkwaY8vcw/3Jnna4++w=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4PuVsx8HPOHN9j1LElx/HzBMF52oDifsO9zk9U9uLH3</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>
  </commands>


  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERujriFo29/Q0gqOwIOfozexZb5bsSi9HWrkIZNpBMrom</encrypted>]]>&Identity;<![CDATA[<encrypted>%0zykrLrNegqps1ohJUdnjo8+TDrq91MpeMj8LIRD0M4lhu9ZmTkRSzY4xdY+BFTZhgc/ZEEk9CWOUUzdpKO3WggM2Zo8s8AjrWJUO+EdjmX3uS0hSK1pm32DvALiAm4/y3dD8DKl7EP6LyFRNx+PV6iIW68dOqivuQvjFCymhPDnPldxCVbZYpWCzx4R/cWNKXiqFH7I3MKcEfFp2rY9kM1nwO5ILENRni56RTBMUNFn/i/ePFILfUmN5LI0h4GEOH+P//Wjd48ScSHNmNZ/9Bv/ozMWvOsUTMu4YbP7yEkRqzAy9kdkPeMqt0pB3NqJ</encrypted>]]>

    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TM6fvK7Y059H1vOr4HtdTk=</encrypted>]]>&Identity;<![CDATA[<encrypted>%Kbufz2Ma0t2rOdHaaRlgJZQ+qjAwhIH75YSRc9+nasoIJqbcyJxDUQDeQQgPBMKYzURT4LElQpxCTgFJ1OGNoQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%4LTJz8GKx3FEGuPX3Q5xYBEN26AeGseo90FeE5x3cjiFJWrjU3LKdAzPfXo8B96T/UzQPaNM9N+ItitSPp1WWv4OzwVhC2jQaY79MNL1GtOx64cHi6/dY2JDgxpWw+yxYOlY40UDHv6JzTVXBzbo9dxMhV7Q93q4xh+gJ1Bnnt8=</encrypted>]]>
    </text>
  </css>
</dir>