<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="txdmbp" code="ma_bp" order="ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bộ phận" e="Department"></title>
  <fields>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"></items>
    </field>
    <field name="ten_dvcs%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bp" allowNulls="false">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_bp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_bp_me">
      <header v="Mã bộ phận mẹ" e="Parent Department"></header>
			<items style="AutoComplete" controller="TaxDepartment" reference ="ten_bp_me%l" key ="status = '1' and ma_dvcs = '{$%c[ma_dvcs]}'" check ="ma_dvcs = '{$%c[ma_dvcs]}'" information ="ma_bp$txdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp_me%l" external ="true" defaultValue="''" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_bp_cp">
      <header v="Mã bộ phận phí" e="Expense Department"></header>
      <items style="AutoComplete" reference="ten_bp_cp"  key="status = '1'" check="1 = 1" controller="Department" information="ma_bp$dmbp.ten_bp%l"></items>
    </field>
    <field name="ten_bp_cp" external ="true" defaultValue="''" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value = "120, 30, 70, 200, 130"/>
      <item value = "11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value = "110--: [ma_bp].Label, [ma_bp]"/>
      <item value = "11000: [ten_bp].Label, [ten_bp]"/>
      <item value = "11000: [ten_bp2].Label, [ten_bp2]"/>
      <item value = "11010: [ma_bp_me].Label, [ma_bp_me], [ten_bp_me%l]"/>
      <item value = "11010: [ma_bp_cp].Label, [ma_bp_cp], [ten_bp_cp]"/>
      <item value = "11000: [ghi_chu].Label, [ghi_chu]"/>
      <item value = "11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdfwevx6xXowri206sjdEyxTYXisyodx7vTVnnKxmtmOErsJEHZmZGK45k6g9ojpT4=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2fTth6QC9ICNGXfDAqzmu/EWSMyG4Vpr096pqvJUQFNExKQJFbbbGN2n47s6QyqzOfsmXtiNLdOj6lDNLKzO+oXsxqZeaq27wErAHfbmdd9Jz3Py/+hJX5k2Cu/FLEv1OWvW3qGVnM7w/MGIj9JwW7qqJAWoMHXWuHR2QAIA+WvJmU11/rKkHCQez18GtTTOgHmp75ahNAwNcry3+6/74xd53w2c2pNm6WFC6UxsFNjQg==</encrypted>]]>
      </text>
    </command>
    <command event ="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5m89ekqRHOxDqDsnslk7j464rPs3jMlswhTQO2taeRSFnBbSehjsvYGB9QZq8dskRCuTGtt7mH+Wq+mlsSFTrs=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaXhD9EUq9woyJdGHRoPlzR0l98HOgJUZzVKMimw+yuj7jgrAENode9gobY61z8Ms8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3qxCbUW6WhnYSQQIMPI8mhW5/TzthQAWywsBBNbpjNPITKt4zCE9ayMtl33c4nfYOZ2quxZy3u/URi2fy/P2NfdXf9kcacjI7HV4MEUIZ9Hu+n4k1+p54lpIFbwBOydNJaCV6plrUbMkleqbaUP+SWTOfYvdC/pSwSrJPGZPJHtuiS8F/tRBasAluGaje353eaxxwUbtSb59OCvP9zW4hgCrQ1xZWPjl+koqmERDRErTIVhWZHRBHjydjtg9csWO70MeQaXFxMAzjlDzK1blb9JfhkpFsptXH1sEU6wYoUa0rpZH3tJlM+r4LX92AKpIrB/r8PPgtULRm9ttBUFaT68kQRoe6UYkOvE05QR9YS80g1xQ8FU13cCg7no7b86m8aHQ0UUvH6Jy8uJx1xJ86WDW0dTznKgonmGjWd1bL/L4AjLxU54GLu3k78fwckVOOInc9CsHQHm4vTPkEvzfjY0Eha+WrVICMPIDRcqyJI0Fvnqq/PxGAcyBTwIndxAE0x4us0kkXF9IyVZj1sltLdk/pW41w3zktOYtEftu6Q4RZ9VAMi35GjJzRghC3QJgpQiTIYU1pcpcU6xlGvun52D</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nfXhuiGxtx5ilNScGK8aDj/gaPT6XsQe3KalGvQju+Gy2qGtyU1eE44Y58GzT8kuwWrC3e/zyDRi5qNQA+JVXFQrFCNRUUQyPgm1nYV6id+GkKbXQlC7NDEpNwickdge/zQVFHj6w3uxCFnx32qZwU7srPG6PIx+Th4sXkPZoKg8GzNhCgn6gmZIkxR1AbB+w1NtP1nXf6WDq9qpdWH+eyi3vG9aWAWCcGbJFBzu1ghM=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSYQ5CdLFHvPPQjqV21XHIoAuoFnlsf4ftWBh45PqEvMnbkglLOBVJzy7jwcFBRfEmzSmooj+ofObZz1gJnGOUCau3XvOfu5aetmTtEu8vChHmfn+50xAs1OOXuK6SsUQhDYUCqZx4rl5m6ldP+6FVFN9SiS225hChfpyjRdyu1pQrPxB9VXbNEPE4lqDVOj6V1lc8AjMiGDiujGD8wDI3qp9IQJBGH1N3n0PecfqcJHS42by4QOV0uiPY+dGO7w0ixixLOw8qDTBCY3N1Tarn9hI2doDpoVv+0YS9WzThjl9tbJlYHy8FJBKoQ4mlDZU3GtPPa8K2GjUq0gR3JAtozM=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbejRN51d98vJNgrmale/BmbKJhKVuFVjZuUVxtvZAdwNA</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5z2HXYoQ4zQNznh/i4b3xHwixaNb8tWt+agnpi6vCGP51B1JQL7He57qPx1B9r7AIqNeCOlOBtirMDWLk9yvKb4UA6y9KRRGz663Qvk3MfDuaLn3KfT9Y4H8LBvgcpvZnJNErIAZXbgKkQCy1v9gnD</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkaF9Noaj/ZsjAqGwrBTPD4gxKrgh+ui469H/UJK6bZk1LnsoZ71jYdEf+w9C7EQBGM8bNoxOVb2imM/pEB3kcqmVXOjJ85y9mCqihd4e0OgYy0uwGN4h8lGivraAXYyOh3SCJ9kh/I3AT6mVLgiOpFzvwFVwdFRUl68zaEgX0RESr8urj0eshz6xku4QbR3da3OkXHXyG5Yx+Gngqk2Ug1fJjYzPzLSCmG0+MX+bTHewKuG2POkQX3pNpXlSaaDL+A48N5yV3pXjOCWRKxdEFbOxzETSP92r1Sw9WPU3f3NziyYqCWpzqyq1I4ruWsNxRVMinC3uoLRD0nu+43aXJbtASYzijQhRJJ+xxTzJFSTumPuCNIrKh19gXpbTm+1fLsBCrG7FmnnhARTzh6HE99OqIxL6HnrL3KOBCHgwdyppEm17auHtqGpvxh7vMkSHxVXZovw6f6QNsILRJ3QSF+Aws1XKTNUE6BoM3XjHd4uJy79Qk/ztSO5VR4kqQiG6GA=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>