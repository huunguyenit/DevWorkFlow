<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="hreqtlvht" code="stt_rec, stt_rec0" order="stt_rec, stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin quá trình làm việc tại công ty" e="Current Work Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Công việc hiện tại, 2 - Trước đây" e="1 - Current Position, 2 - Previous"></footer>
      <items style="Mask"/>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Tính chất" e="Nature"></header>
      <footer v="1 - Công việc chính, 2 - Kiêm nhiệm" e="1 - Official Position, 2 - Concurrent"></footer>
      <items style="Mask"/>
    </field>
    <field name="loai_thay_doi" clientDefault="1">
      <header v="Loại thay đổi" e="Change Category"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="1. Tăng mới" e="1. New Employment"/>
        </item>
        <item value="2">
          <text v="2. Điều chuyển bộ phận" e="2. Department Transfer"/>
        </item>
        <item value="3">
          <text v="3. Điều chuyển vị trí công việc" e="3. Position Transfer"/>
        </item>
        <item value="4">
          <text v="4. Ngừng việc" e="4. Suspension"/>
        </item>
        <item value="5">
          <text v="5. Đi làm lại" e="5. Resume Working"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>%JO8KpuaQEdavFFLHjjXBbzqsORkOVS7VM3mJEi9CY+2z3vgE2+5nyTXMY8nlNDXLa4YT6U7v6DXycK7lr3KqFLL20JC3emN5WhOf6JbUYTg=</encrypted>]]></clientScript>
    </field>
    <field name="bo_phan" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller ="hrDepartment" key="status = 1" check="1 = 1" reference="ten_bp%l" information="ma_bp$hrbp.ten_bp%l"></items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" allowNulls="false">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZeq6MyCyw9JCOpIVYoJ+TsDgHPCU/QKoVy7vxhvN0ilEOFO6luwz47iFypACn6bQHyw/rfbu9lWF6nNMGiZaxd0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="bac_quan_ly" allowNulls="false">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1" information="ma_bac$hrdmbql.ten_bac%l" new="Default"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nguoi_quan_ly">
      <header v="Người quản lý trực tiếp" e="Direct Supervisor"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="status = '1'" check="1 = 1" information="ma_nv$vhrnv.ten"/>
    </field>
    <field name="ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ly_do">
      <header v="Lý do thay đổi" e="Reason for Change"></header>
    </field>
    <field name="so_quyet_dinh">
      <header v="Số quyết định" e="Decision No."></header>
    </field>
    <field name="ngay_quyet_dinh" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày quyết định" e="Date of Decision"></header>
    </field>
    <field name="nguoi_quyet_dinh">
      <header v="Người quyết định" e="Decision Maker"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="ten_loai%l" external="true" disabled="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_tc%l" external="true" disabled="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1110001: [loai].Label, [loai], [loai].Description, [stt_rec]"/>
      <item value="1110001: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description, [stt_rec0]"/>
      <item value="11000-1: [loai_thay_doi].Label, [loai_thay_doi], [line_nbr]"/>
      <item value="1101000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="1101000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="1101000: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac%l]"/>
      <item value="1101000: [nguoi_quan_ly].Label, [nguoi_quan_ly], [ten]"/>
      <item value="110: [ngay_tu].Label, [ngay_tu]"/>
      <item value="11000: [ly_do].Label, [ly_do]"/>
      <item value="110: [so_quyet_dinh].Label, [so_quyet_dinh]"/>
      <item value="110: [ngay_quyet_dinh].Label, [ngay_quyet_dinh]"/>
      <item value="110---1: [nguoi_quyet_dinh].Label, [nguoi_quyet_dinh], [ten_loai%l]"/>
      <item value="110---1: [ngay_den].Label, [ngay_den], [ten_tc%l]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9NfuaG7i3j7e+c+oQhTXMYAxJVNBx0KLk1Xbs+Pa2K5gZkCfCYcjoUUEAs6cz39IK4S3j4RMYeosELr/WtECxNulmk900zGj4CyB6c+YgaYFlq/WmEdmRNv5Xkgm51hSw==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9NfuaG7i3j7e+c+oQhTXMYAxJVNBx0KLk1Xbs+Pa2K54yKSZXz6QeHoa7niM1h3ajBsWf4u6K1+cUOrxP72donRHGHR6h5c0H1wjfMZ4V8meYXIeWN/RJ0H7Pq7KNPvzA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYL2pX5KDJ2CtN0qh8ZITTPf02nOkmPmNSqxLXGU9bBMP4AgWyN8x6bQcaiEtPlATFwUYttHPs6cS6JHiAHdkSsZ</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbRmUFg2I7pHOF3ybw+4B7tZ7HfqQX38LCrv3s15xsvNuOof47O6qn0he3W6Dgp15OVHyjRRaOJZUYCgLkEpAIEpyqwn7E80RWYY9ri3K2q4gIPUPFWom0Buo+aC10LxsGaiCdOoz0kYOseclbglRhz0fHxtAXRhNQBkkyf9fLN9zRW5NLqSl23CmW1J8RV4Ltx6naOTgVCFE+nxWqAfjPndGDG0VryJopJOnouPUZpMVTmxlHg0BGbV4OtTbA2DCgSAkdRVsjYn51XpuSN/4P8vxa2fJyK6ni9zf16X9dqxQ/V9NuYFJmfkOtBU5mn3artnhb1/7I+VfcfrMdtFrPZd6yNHvZi42mwJqE7F0ASzCnyn00d4O+05DrEFAHO/yZD+f+dzNlVqmIboaYH+aeGazfTegH3GhoGi5Xouofu8pMGCKvS7ygyMTpJPGelQHKf3SnsHfCy5IO3PZY7DyKImxXIrnRulpyjAEGQhUH3UAs/UutV3/643iLzgi4FtfHQ0NNMddfgExv+789JwWyl9aBWqh/hxe2yV1IER9/MLgpbi6pQ6WMrn7Dp65tPYdYPgOVnEsOIHWgA16dWbkQ1DQmjWoxU38HObPsKunwnyST9fDnZjXeG7rRhXRXeO2jF5A1P3tIu4ovvqKxAtcT44zylgKYGI94gq+xKjdKI6MBxf/TFCEMG73GeKNqW/ru3olWEe1204tx8LAnBF+YQgIcryKy75g0tJRhUHv0qZnb2g6iBG+Vf6qsR9ADh1vBg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf55DghrWwBYNFKOfbv+oHzbnuQZVaKXqpUJKmy6aDVLiNRY6qUF4KzPbu55of36F27280f0fRWRn0ywefRcbFUsmUr/nGPJuuFTl2nk+0SOOzZO44rHfnsGzLUoZf2YiaFaJiYmuL6kBWMjLCI+eSobas7og6GOWhKY/LrvXzSz4Xt/kU8bPC9wmVXL5eCDusujKrITWXKY71BSOykRnc9Olo6M2IMBw4N7ScATGpXIMZXYOwZkuBdM7wB9FWp1kWN3KS/8vR3C1h4vD0I78lzP0NGab9dxXZJj4RVjjudCyW/Q48pxPsXeH4FOr4mmlG4jVK7ihoeOoJHeZ3L7kA7Df8Fm55h8ffAvq5/cIhHJ/1X/4hJFeRyUYr+MfCdOPH1ZHSarG1IAbN1BTVVhK1GU9U5gezfUSJUUYkb1iJcwo60JpISH7nnAM/Qb10V7uHW58oZi8xFpMK+WMyM/8BXOIP7NP2rLkJMOjd3+StaKGYmx43oMv0U9Vl3jeAboX2WUX2IV2ZJQW6VxG1zhIbX6pitkOtWAGmTV1dgwDfYQuNVybBlNhrG6CVclx2Fid7Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzq0nWtT8W+lPzcWgn4MSIpZeLfzzXyuBeg/6bRmx4PQrQ1BJ3vAYSO8Iwo7d4P9ds5ClWmJKWKECGPIQIFds5YBd81xIQghyP0K6yCZiyMetvAD7nthMRhbfM3eWwBOi9zOF/wGoq47hOScHzjGIYyoqKoBVA11NqDv/iSSyuRhZ/i0CKBVIBhR0CiAw5TsBjD5beaByvFBTuYWsvBh36GFnI7qqp+/th/29vC2hENDvrdPjw0cXM/8usrLL7PhzsPD8TH4pIBMdpsNsfJt2VOCBg2amFpwwRL49nf8mjfQvL6NVLfCPDkYcVFvyDKPuGQJNfN8/FvW9DcSb8ZMt6mRHJyfKkGWoNeFE4WFQm1xiXJORtL5ABwrqtK2n9wuPVR7713nQ775Tc1966JrEww2rPLrb8dFDxopTp3f7hg67qDgkP/IoSrE4WjfV2hopitQyPuXNGDABbQ05ZLg4FCcW6cdpRK/23AFLf0nyps4qVk4w3/EPmv6Dflk/VbzQNIMiFodCadY4ecjc0XVg4152xAV/6AAycY5lJPxE9pdj5NFJUDUGDE1qxafP+xQPo2YCqNIMoF1p334ICqX7vw7lJVN3xn0StCBfltJWDYfPuIKlB+WcWKNSGfXKSWZ9VA+Yik4E6BtB3LH9ld2qWvLTfFEnVxAki8Kt8RqASMZ/enyh9kzrPx//Y3RKKruYqYcga0lSYixMygcM5N4IP+iUX2MSWZAZ/uZg2HSyxAfNrnL8iaqBQeh+ic3iSGnIRmGZsyExmTiOUJHEF4sVf8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf55DghrWwBYNFKOfbv+oHzbnuQZVaKXqpUJKmy6aDVLizJO+M1CS8+wQ/LnF3R2e1MMS1CN2OZdNd8ZfOTMwqjfPgJ0POrs+9WhKhKoVNuY1GlR/EonzT9pu4Mg77ZUSO9vuObniIcqj/Dz34MuqHxV//qjdkx4K8tNJGKUltd21dXcku23StjnoA2HY+3wPienpjcyiWs0xIIefk4nc+H8EMNRqWAGZc83uZFhZ8WuIiFCShwVs/IwoJxXkwVjK/OjNPna4Tie5/7HPVYA1lv8BJ4s5zabbarVScUX+qOX3d9GdffENkEjFbbTPBNHStNm29zq+IxFcB4qO/y1mQjgA39DaAtiXMz/RCgD+QXbeRH8wl8iJq5SnJ5ApBFtqlcJBxnU6P4gD7Ft3P5n5MrigpQDuKDNzoVjllhcWuMA8w/X7llfTJT/bbjSRxY0aU7ZOpbFGQiQHvKMwyU2DXAA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzq0nWtT8W+lPzcWgn4MSIpZeLfzzXyuBeg/6bRmx4PQrQ1BJ3vAYSO8Iwo7d4P9ds5ClWmJKWKECGPIQIFds5YBd81xIQghyP0K6yCZiyMetvAD7nthMRhbfM3eWwBOi9zOF/wGoq47hOScHzjGIYyoqKoBVA11NqDv/iSSyuRhZ/i0CKBVIBhR0CiAw5TsBjD5beaByvFBTuYWsvBh36GFnI7qqp+/th/29vC2hENDvrdPjw0cXM/8usrLL7PhzsPD8TH4pIBMdpsNsfJt2VPBWYBtlbagFszkMxaOab+c5a1mC9vcmr70SzCXFzw+6TdfxH+mSiJ9byAMk7HLGK+rMwUmsNJTwTvOnkFTOL7+Xc67bWyothlrr/2AADNEtcWWxSMJefcdBRFeRZacObWuEDlO5d9nQ0KihZWb/xfuTFUhL4KRGJi912lDlcIpGa8Q6eo4TifKKBeStx2ctfjVfw/+o+IyhbXAdBO77DdmapaViX4E9dUVn6y29jnbWahUvw4FqLN76IvUNsuq5v7+S2KMly9ujskVGGqlBtUOAvnIsOO+Dz/SkPIAG0LrzmtgKExbvZXCVV6rjFPXbVR3mK/5UHpheShfYrBIbEZuHSeHAPqO4s4PwE3WdbJkq0Z2uCR/RtRQugDxHSvpZYrgJiG8REPwiZATnYhlpdZRaAbZj4nOl5m4hvw6wxxcCaX9oAgsZI/BkFXM5wgVJOrTYG5mL+++h8QN+SDmUPSyJDNAUTXMXPoz7DEw7mbzelfPNIMVnnG7fW9aJ/AQWKV2XkWSN6lQjxOjmWJRety4whyLhsTNnGsxn2kLuWBcLg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3c0rzkvCWFOuaB7hsJj9I8QbA0hjN8DtPXOfvvHqEQUTCG2D3C/qtgarqQcfYNnPB3yN94b6VqPn7vY6DRMazxh6BwY2rCrLqVmX9HrnunJ+hMTOPbKSFKbknlNGxUHKY+ozzMzAhRy4EZBPy3CXz07xREniCaR9psEgezbtaVQR7jV7Qz+E4PkEqSK0vBqdm9T/pIPYCTzj0giFRVAgr8C7QIA34yzvAUPkxSFcLLR8mTSqNOved/Lp0gHYRM7HGd</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6WfIEtkb5FEWMX2yMTqDnClGzHvgFr3OKPmAEDurE2uQ9FpvPrct1Q7Pc4w1c+IAga0yNA7nq+XY5SLQP/jQz9wrxHUudRMcLUJkUZjBGXuG3MNxG/EFITTAzt3yjDJY6zUGKoPJaXcAduKmtlzu/AytlPKyUtJh6BV4DsmWo9Vv0oujw2DSHQ+5QqRoajvdu8/SWJGEXBPvtrNpB9+BNxpWZcm2sMHWj7qw5jkQpXxxRSeY/0ZGvPWh6Ezh/2CAo8VxcdyrUzJgl2irzyGnsf2Htwmm/QRRhOa7jyHlJz6uMhe3NCzPrrXYUYSWHwx/Cg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkaibD2gJifO6u5ztQ/JXm1JPaHcyPKu2tSIbkg+pQY2vKIC4GL/yKdw+EnyI3whrQjxKz0jh4F+m2++BdZ8lssLI8dBvFahNGmTD4Eis/BdBIB4MB2FF97thcL4ZiwZs4I3XSGGT/kqLbL8XNLURExPXS4WUW9OZ/ZGFywPICExtnolCUTeJe5U0K5hEbfqQtFSX9shniTiaB39kSmDedDBM51y2o+xXHckmD+BWOORWDcyOJIcS7kkmFKUGZJWf6pYlMc/4QJcbFtkLtQw8rdt9/1OisU4tvMOGy5DgxpQmJKM4K+tTZMcWggGz2p0z+4s+cPYdELtegJ5apBskIxErGyOHIzU2bGbnMWXsKNkOFh9FK2PtN8wFjw5ZE5JcMyYpMtIHl9piAvISusLv8kmugNNRzXQZVifieE6wTECHb1BYg6pXuS5pUNcP0j7Z8oeOITl7tz2aQBKxR9XnnjEeCB4YFg+gZJXBl9zt/ceuH32ubqvBf2J/4EoZtBXrQ7pufj9zMwuzGDFbmIMRR9fBWlH1KnUTJoF+gHxK6PZo1Yf5y/afmMwK6hzJn2Og1je8z2EZcrNfwQASQ/dTr59BKBEgPsgrdQJN+iFOWQxVWSPSSFngLGmBDYcpx3vdc1WskU+2XaAKgRrYb4SggtyB9STqZOs0o82PDlEeieJw/mujAHbNkwmsiN7Ya9bti90dmCVfJruTjoLgwggiWIZa+S+Vbk/heBjH6+XXEOeS/6oMHiTaRa0su3grh5eyyQEr+peCwEq+YD6UxddpHRN+zCI5G4LN/nt87asA56EhIxlBLrzxPUyh94F55cpFtA=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Position">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7gz9C/EZvR7JrtfjQrB5LwDXKC1EwgeqImKOVfBgIEHfCCo/UbvF13f8pKaW2X1ZiBnhL95GkXNav6pb842FlYPxq54K961tlWKTt86sZtxv7HXFd1SuS6ZoMjiFaDVO/vv0xbzfEId5xG1LYJUxQPvMKX4mHIZbssPLtIjF+begTYlwMkTyLbrMxRAiD0Ogo=</encrypted>]]>
      </text>
    </action>

    <action id="DefautFormValue">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6V7AjC06V1t9U0HXyU7Dajfw6q48dLJakzd/oVQ/u6C2qboXrFii07LHMDmE+e0fitvPljcoGcTvvvx5n6IG0PdZN2/dCZ0XvyehiFmDsGM8oqjA3cWisqRZeyfEooUT30yJrtqjLCVjxzNMKUBU+VjR4Ab7nzSAZR6FV1dqNzTTK5cGiJmWVmD7lkJkKa/wxcg7blafn3o5fHm/Wu1Lzqm0PlM4pgAKhrqDFIijKYGsheHRMSyKYApPDr+xEtXDoWgFgVkBNPuRghtEar9JL7OK6+x2vkPPrEdycZ0LWwBjYnzJtnB0YcUnCD5ugIen68KBAkm6QF/00FWsMuokOALHa2Mzzd4ZAEIn5u6bo+Oh1n4WFS/u577YM6Fel+DmsNCPalW2Dus8ctJLWKw1Gnmftxg7UApzNLTtTOvZWjwcBrxjCk3x8Ka8KTStBN9zksTjaqDpfGpZi1L81yEQmmpZOkbWJeMwOGEzKpUvI0I4</encrypted>]]>
      </text>
    </action>

    <action id="Category">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6vWw2zMT1Qo1nZ++gYM/C0RHouPgxi/Xc4Egfb354MlpdakgWkMufr0luXiBWxrtRjJcmQi3t+nSu90/8UCVn5MR3328adOAi1sDymgRn1E+I0fgSWP7aJRepDV4WbiAeBrS0G+TJaMyycy2tsWn20byvEtv82rZL8xwHwQJRTfyxElEqbGK5sfdR5A/WKGbFhpNRurlvjJEaaPnwhUl25Lecs134gSt3gHz/ze966/n0ZY+JXYJxrzzWE09vhZ8nxf7iY3EZNcsYJyr4vA5W2ZxvLGhwyH3YHX7AI2A8y80X+ECvqKs/70fatkNZisM7ZyGlrq5bCe2VPULTqZzFPF2YGsO5E0mT2629EzzfTV3R/hP5BKu494d2yk4h3atIrTT++rE1/7JosDr/GluQIIocrhuw3bRvxv2F24r7vNAj85DjviU4kCKzisk20OXM=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>