<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="sfdmnc" code="ma_nc" order="ma_nc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhân công" e="Labor"></title>

  <fields>
    <field name="ma_nc" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã nhân công" e="Labor Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_nc" allowNulls="false">
      <header v="Tên nhân công" e="Labor Name"></header>
    </field>
    <field name="ten_nc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_px">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1 = 1" information="ma_px$sfdmxuong.ten_px%l"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_nc].Label, [ma_nc]"/>
      <item value="1100: [ten_nc].Label, [ten_nc]"/>
      <item value="1100: [ten_nc2].Label, [ten_nc2]"/>
      <item value="1101: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNsjcNw4zRKATSYfY2PZdBYWGh5Q5u/IOi1miL/NSjTL0nfUCHXx9XIwX8KUmi69vjy4pQpZ/dWtvCSeemXi1Vo=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLvjxYisS0C98zsCAhtXZjx6/NkEh0jSOtZMCxMOrC8l6J3iiQafaT6z9lFzTwkm4zjI5ouhT+AWa8zcErTSpFfNCaVigxbDYrKPUnRL3Hrp</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7zUf/9ZOjtpNZZoZqBHdQ4eiSJFZt8UQO0xuhv1ekTUzXIULZSAnsqnPlpdgAH9eHSZT9SOL+vKYHHaiaMNTf0M32TsJfW+ZHalSoD3b5ib9mTkMP8G6RUhF4MOLcX1MPspP3DlO3T9tqOyhtzxytoMfaWLjwMB1JR8lh+nRhyYZ1Tk63SfayChRwca5lI0JRPuNAv4t3PT57rabxmmq9UjY35GWuNHq/HECQob9ahgP+YnXgr1mq5SNxPsu/dwN0HsVpJpDZDRX0kjj4xUiCj9DJjkIwu+O0W3Rm88RxknKSfOhQrh7XQFBH295D9WeDkItqYcWA0ErRNCzmz8S96nTOhXRLY5Pp9qBAwcuYN402v1qt0xBgHN9YZsmANOsWk+Q4RrC3ciWAensjQPLYlAmaUfycTUCX/+52v8xGIt3OnlBwniuRt7PCjC+/FbcnRZ2MDtyMgfgR99F6SnmDSTjEdkT06RKSc8Bb1/R7/cKxNPybGOHX7ssamFdT1+DLwTRs4uH0e0Nvq++ODu9puo=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CkR7SIitYYMbWdvHo/+PiYuGvLcq9QJ7Y3xWKAB78eOFuhGmem5SVnBiGpZEFsLhrhd2Sn/B7ceQk2XjP1BA8grPNHq7yh80TegEwSOqFUW6DWix42xy1aZKwTp/IGrYUEU+L79uOxNTHgeCTyKJ85WK1J+ISJAiLwOwPryEw2TRrB03trAs11LGmLADJJiphZg9EwjJhxKFNV/ItebfBzUkRb3AOqmHIZuXxD1WqfHU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLzP23hl93wkIfCcqeDjK6CmmfHRigMN4Uu/fmSm796ja+QrwX5toaqpM7m/japi3FWUVmlvDP/p+xjTL0Qa8cTXtOQzphP/yIjrOIQWjIuyO6z+rvyzb50BYpfAn+OEYP+Rw9szDEjWuAlWaTUPXZNiN8urQ840uykS/OfBSyf4roUssmjxzYu8Rb3wwb6wmlDvIVfFmH/Pp141alfmpHWp+ibTBkeDAyKUzrGNNoraSUKi6Bh4WbDde4cllNaQ5UnhopDPEDarWbv06TKeAfkuQi9V+mX2n4YC9WDbe49Bc2M49AcwQQ1sL6/BA3Mhr7rzfVBxRRMaw8gu6+3pNo9sv5brN6uQHAPllca50598G6qJFIE740cujEkWygZRRYJywMipycIYZmmILFtDpooIOJzCnzJQsz1Q/VUj/6DbmYiTPFFVBjsFTA6pe/Cz52FWNw7TimZf0WG0bvmymzQoKX27JlvJncnUhQCLATGxzvvYUajQ6jIQVaYPYic6+c2YpFTwPT5cMUyWZRU7KziohBfAdCqsj9RzwXTpBD3FM=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV/FrvOKLAVuNWPgGrL3zZKd1eKB5PcXAWHJwXpfG9lF2</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4/B5vSrz4CX//Go8grYVJXRqk0evWt5U+S9PwnlmP2PqxVfv4a7qGDCLHU3+XT6zmMB4SfyaZcWgleXnj3CXuHb+yxZQMi2XjPnjek03PeUC3dDlxQNWIfjZp/rWZN5zhFazVzRNvOP0PEcwo7QigTI8PWGSZZoCYOo1XHSiRbixbapu+f7qun72iuTdoO/VO4DpUNIvBCelejaPPnkwlgPXPJZKkJ4q+0/6sYEfxZeey9WfGsyL+R1Vl2JQuFoAi0Yt5ssal+7UhcdUlz2ZmtFMU8prSn3RSeqU/Peh7P3eMJFtvRogzdY7L0xR6OWw3a93gHm4VknbLVTXe9tHqtY++7eTj/G6uUvTH52Wm2A/Y6CyCE4hh30hQeWDa3HGH4OzFFUJQ2nk7NUkoupAiQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYSGlpRKfXTMAZ4HrVpQOCufuTdshfko6KV0OvU757QsQhxn2R5EUtA0LCPeg03eYkxwhb5VMvEPWbSRoXZUHFMwLamBYJLFPl3YyMpAfFicJDlyEobQMg/Th9AJ32wSbq70av7jSbgCma6esW0hlKdMNwyQ7Ixg4jHIkuLHtCf/tPW2RzazlZZdpg7iBQ5v01C6KgzPEn3iWmSCCd4mBvKWFdC9a6PBjrAEfme8T8yExgJCq90yawVXitlcnFUK/G+Gfv7jqUy9GFuRDqylEIem2TQHqhEYiENPpcj+Rczj</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>