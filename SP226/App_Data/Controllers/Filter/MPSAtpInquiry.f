<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "MPSAtpInquiry">
  <!ENTITY c1 "&lt;div id=&quot;&Identity;&quot; class=&quot;&Identity;&quot; align=&quot;center&quot; onclick=&quot;refresh$&Identity;Form(this);&quot;&gt;">
  <!ENTITY c2 "&lt;/div&gt;">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khả năng đáp ứng đơn hàng" e="Available to Promise"></title>

  <fields>
    <field name="ma_vt" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0' and status = '1'" check="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0'" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZao1qGGTjWf5MN6GiksP6tKIr48GQ5pfr5xOcvgooU75</encrypted>]]>&Identity;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vxLt6na8zQrNYad98Sr556IP98thb5//zsI7je8noVoG</encrypted>]]></clientScript>
      <footer v="&c1;Làm tươi...&c2;" e="&c1;Refresh...&c2;"/>
    </field>
    <field name="ten_vt%l">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hoạch định" e="Planning Date"></header>
    </field>
    <field name="ma_ky" readOnly ="true">
      <header v="Kỳ hoạch định" e="Planning Bucket"></header>
    </field>
    <field name="ten_ky%l" external="true" disabled="true">
      <header v="" e=""></header>
    </field>
    <field name="dvt" allowNulls="false">
      <header v="Đvt" e="UOM"/>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"></header>
    </field>
    <field name="ten_loai_vt%l" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>

    <field name="d1" external="true" readOnly="true" clientDefault="0" defaultValue="0" rows="307" categoryIndex="1">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="MPSAtpDetail" row="1"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="5" split="5">
      <item value="100, 100, 137, 100, 100, 8, 58, 50, 100"/>
      <item value="1110--101: [ma_vt].Label, [ma_vt], [ma_vt].Description, [ngay].Label, [ngay]"/>
      <item value="11000-101: [ten_vt%l].Label, [ten_vt%l], [ma_ky].Label, [ten_ky%l]"/>
      <item value="11-111: [dvt].Label, [dvt], [loai_vt].Label, [ten_loai_vt%l], [ten_dvt%l]"/>

      <item value="1: [d1]"/>

      <categories>
        <category index="1" columns="769, 0" anchor="1">
          <header v="Theo kỳ" e="Bucketed View"/>
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

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Qga6QGoK6kJv+toQ/pLV49JPIADktmBG7F8yCON1ZplUjXSaxnLOGRBHdQibjcb0l0FRQlITKVnRTN3j9qp1RegBBGpbrorNNjcc/Z72vSHwQ2vloUhcUHFrvFYvGLGdgDFn7CZigzLX//jzcsGDzg9St048kfduMcxMiHMxwLGaufnij69uVktsZF9ZWdJ5fneGnKC9Zcj20FGABrA+hNredEqhoB+ojUue9jviTgb/BwuZj31DunSndoFUvFhySs40GzYQVlfRKjQZoBNU/nbobJFfPUz+GW9RQ7r1QEdhqg3LNEvvNgA+BNK1TMFCfdzAFbjbWBRex898t2e7P79sV0SYxCOVhfeZFihZGJDfTDLjJqQrgCtVlxDLmMVvpEzBKCSDT2I3tjsNCIkAnQQOxF8YmjsywvTQOQYQAGGDIKbrE0SSF84xPp5yJGkNa1IIGl7e11ftZXH/4XK8Bo=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOIXQGZohWM7wsqr736FaH/cV397qy4sFRxgWAZJi/5X26g1cPUEAyHPAsJx9S0trMcU1sMpqCbz66yhJ8Ruv2zjZBXFKkWVDyPW4VM06b2GkQBPcFigZ0GX66J0y1w6Q/K0pnOnqx5dtVnZNZBNYHuKzgqNRpjxD1+wiMrz3GcQyWjB3PuDWii1zC5VjnaxiU</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERgT3VoUeVdSuU0R/Jw4denU2jEDbx5K2Za13bn2u7Yi5blkgeVYBs8RJgIM0unHBQhGnuOMw3Sxfe+TjeJxB6g8eEjGwx1OXjq9llisMbCjch96yVAx+bg1rSVPfsSVv0MC8wClIGS7B4xZ72Vtd8KUGWTziSvlTiOrXNYcz6wNDVJ2gmPXzQvqVvjylfBS43T8+qliLSWjptvaP1ysxRlJvhGNAYo2mO6GxocviLYEjKYS1lUKmBbMc+isrhLw9vg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERujriFo29/Q0gqOwIOfozexZb5bsSi9HWrkIZNpBMrom</encrypted>]]>&Identity;<![CDATA[<encrypted>%0zykrLrNegqps1ohJUdnjo8+TDrq91MpeMj8LIRD0M7JaZFTknNnnkplTuxtgltlPBWTKW4ZAqhfBkLFiLbSr6mvvd5/gvr2D4V927+W5OM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lYRrHPmw0BJRzOOhpO7XqBTiMFDlduEzaXN7VrSNhxGJTtPDG26P9bmAiYhq/pi3X4zRZCXNkHsIRUg7LD0WsGb0JZJlp4GzHhoeUtrbqAFAdcbX2TddzrQQmupymv1pSzLsa7ohPd7PrljIjgZdRAkibAx0ES4Rfj5RmHxSAAfNg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERlsJRtb7H064dSrjbaiOpmkiYnI8mw437knhEuVpROcIb9aJv/O8ugeGEG4VxsD8/A==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LQsV6CVelrJyOleUwhZ0dKPo2DZQu9ePkZ9/KdcskrYgKteW9PiT7YzqA1UtH4ikig=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7EHUdCAm1C6YpTd3s5K4yO+Z16qfg/KEy0cJyPsX3HgqD5jh7rGvxOLuo7CqBxUpV6WJIkaM7slcX/vECoLCEudxXWP7DFOkzdcYxadNq/lXtBDG5XOgE0ynf7gztHUJitDP9sUprwebH1lvEc96ymuDgJ/ws5zMsK5F9DGmBzGE1NU/MDe7YnPltFK3wuPj0t+HnE4yj5g+cl1tlcvk75ykypi/BN47Zi05FawFAYiYY3+4eAkp9cEh16+4y/H31ocQMbyUToMh/Ll096xlc2q5kGNrwt8E54JRKEpONAofpUlw13m+l0GBwee4frj7HS2l7K5EdUSbc7e1aWNymrNknV1w1A8bP6/JBUmOo12/wzC8By/nroYOpATIo2fwxMpeqtb5ZusvcmKtPbdKbGFJGkjSbUUDO65xVB0BmR6V+aYND+i+lz3Hjmdj2DQDtcDfU7+pbwUrXwvRts1/fEyekpSn20hcRdLQnyJ3TWZJu7vffmTPvStDqukdAWE5FrdpBZFYnQayP1VKhcrAqyGOqRoN4Q4cIajvOSuovkF3Ge7SmUlsyK7UhXlyTpl8D1JE9H7wWtKhS55EbyU9NsIT+CRIoeG5u4HemlHwccynn4+bnsJza0KlZ/BpIrk+oYYqmArQ41Ghapyf9N2pSVYWMeyp+m/w30Ths+gSPh29QdksbHUcZ3vEvLCTO2nVGXVsxhKRvo8NpQ/c1dLCfb8n5bnQZGSvdrUH5A4cbDeFudIfo3rOYH1KxcFUqG5syoIMdWitd0FdwEtLWfCnbNQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v+4PyfckcnxRrWUatXznJKxpECXm4irHh1vcFBDG8MtnKr9qVd/Qhq5fMFwRZ0gughkFAx4yil14y6QHpw58JpqSar5CiM5jWeSHr6rNpHllqTgMaewG+PbxrS+cBUggUUAcsL7HWNwWN8PU95Uq+I9sr/4G/45IqZcgAMq9Wbh4gP5v03fSGhEtJXEU/cTW1cITk+sRmwpNHBtYosbHs1Ood4OqAYFit1BF/jebMgiiP64K5GRq1xrMPQdh5bqqcaXJB8ze65CyHaEXkyMyxW3qgEq79EKh/x2Qae7WBG+1dn0rfPPlL8jGlzbO6Whi/3ZVxbtzxsEYrdgDMy6keEQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9CEnwFw7Ur7ltmYGbTGJFEwNZ9i4XlZo2fnXzhrHjP17SQQWTzq7agkRXbdHpPGwYP5kiqJQE9MrxRCMNmsWK9bTWebifEIWRRHDTez7sFrEKYgtp/kH2JV7a+NoKYj7Zc8mMrou4UCKwvM4l32PDAFoZhS6tILVKMB1s0mzAZIVp4IfC1dgyTfAfawOxtjjtwpSiyTJkXtjvAXYrPO/N/WuL9Z6iJA9urgV5D+VCNC+MyfBnWZlqQgqMKdAu7TwpPiS4sGD8BObjcDp8fNk22D7yzmY/SgiXDRgOb3lGbPfVLagfoK0CbYFfnYAgAuxR/WLS6d4qVEmPrycF39F7W0=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TM6fvK7Y059H1vOr4HtdTk=</encrypted>]]>&Identity;<![CDATA[<encrypted>%Kbufz2Ma0t2rOdHaaRlgJZQ+qjAwhIH75YSRc9+nasoIJqbcyJxDUQDeQQgPBMKYzURT4LElQpxCTgFJ1OGNoQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%4LTJz8GKx3FEGuPX3Q5xYBEN26AeGseo90FeE5x3cjiFJWrjU3LKdAzPfXo8B96T/UzQPaNM9N+ItitSPp1WWv4OzwVhC2jQaY79MNL1GtOx64cHi6/dY2JDgxpWw+yxYOlY40UDHv6JzTVXBzbo9dxMhV7Q93q4xh+gJ1Bnnt8=</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFbZmcLoLaTcoJ3VP26WNLB0fkFBlTg4aNqUgTXZEebRR9/hO5IfyyAGIM+5acTIJ+8ek7rJGnjzb9/reRrMksV4SKLCVN1ZIfHEDlhVrA46iiu4Fclm4suZFY3NxAe2DVfZrK3T8+i21fxLcDTnX8Jq+sdD+K4qm2zRmyg70sLge04x3I2eg58mUhYFWELag3</encrypted>]]>
      </text>
    </action>

    <action id="Period">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XM4h4WitZuR0Hgkjld7iv5JZmccXWU43Ii2DyI0BaqrqZrtm9lh+vNV3A5nnEYN7xSKQ/LUd5J05fqWzlJV0Dzz++jtxe9ZoIh7hU8M8Vb5fva3tVOIXXR0pQ7Ng9UC9VyCS84hWl6NaNfff2ISv3wuswmYxQZTdZ1UrhxdmOPRJl9DEnlTEuQjY+xmuqkNgLs4NZxDHDCfY8WaM/iUOM8IADqVNlX+zUOmqHQEGPsL2Y2qYZ1sRUHzz1BISWc3T0n7B26rbhpLyMmSnwflWYArPI82xnvjC9FVrwYPKEL5P4yRp3k1+n2EaFwtlBLWleam/d97s6rfRokUPO6novKuyjVtypCdxdAqd1WwCWSt</encrypted>]]>
      </text>
    </action>
  </response>
</dir>