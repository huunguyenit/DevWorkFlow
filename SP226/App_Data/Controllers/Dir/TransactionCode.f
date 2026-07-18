<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmmagd" code="ma_ct, loai_ct, ma_gd" order="ma_ct, loai_ct, ma_gd" xmlns="urn:schemas-fast-com:data-dir">
  <title v="mã giao dịch" e="Transaction Code"></title>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and ma_ct in (select ma_ct from dmmagd) and status = '1'" check="wedition &lt;&gt; '9' and ma_ct in (select ma_ct from dmmagd)" information="ma_ct$vdmct.ten_ct%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Ij2z+JOl/8hWxM5c1sKpI8tTj3Gqi2lgPUWkXIo/sPFPKEKFid0a1u4UZCH/njPVg==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="loai_ct" isPrimaryKey="true" allowNulls="false">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <items style="AutoComplete" controller="VoucherType" reference="ten_loai%l" key="ma_ct = '{$%c[ma_ct]}' and status = '1'" check="ma_ct = '{$%c[ma_ct]}'" information="loai_ct$dmloaict.ten_loai%l"/>
    </field>

    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd" isPrimaryKey="true" allowNulls="false" type="String" dataFormatString="@upperCaseFormat">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_gd" allowNulls="false">
      <header v="Tên giao dịch" e="Description"></header>
    </field>
    <field name="ten_gd2" >
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="type" allowNulls="false" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="111: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="111: [loai_ct].Label, [loai_ct], [ten_loai%l]"/>
      <item value="11-: [ma_gd].Label, [ma_gd]"/>
      <item value="110: [ten_gd].Label, [ten_gd]"/>
      <item value="1101: [ten_gd2].Label, [ten_gd2], [type]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1fc1MBjuN6PeVTlP8qIJiGPyXFkzFtssRLQ6QfE+1+GTBOQAs5M1PwO5JipXo+tRm7od3NEPLQasyM9qsb95a/fkDCibyQJyMfFsGHOsM5CYnNNETt78p0pBpiSIOk2IV8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvPBq2zsZDo1Jk27JnUZKd4IRWVVYEHlfxESJt9U0VJRL82Q2DalBCzXw5apbGsabrBKU13oMwQByYnq4LkUD1EC</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMCy+DF1pSlC0mSrM0CoPN1jwqyWVtVrV+OGxYib+EdArV/EtlkJtmYZpc3j/xZodoVgsd9kQx7633/c2dFNipUDOXMztYY6KrpOhVasmkWXkPnndtj25K9RoghPy/ZCdA==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7zUf/9ZOjtpNZZoZqBHdQ4eiSJFZt8UQO0xuhv1ekTUzXIULZSAnsqnPlpdgAH9eHSZT9SOL+vKYHHaiaMNTf0N/zvwJvD9u5RWJ53dTO4aIDQSVLSy+KQpOx9vP5E4i4wL75ii0r4w5/BZM7adu7r8vzyCmtfh/eYvdZS69gb7lYIOB2X62sqSBh8UDd5ZqelcmmFk9c5+llVp9a4baJuY/J6S+gyMlrcPp1tjTOEFrLskCq4L5YckqSoBx+ok4/pTFA5ctz4S4mJKoC6Z3TshV/7nv8sKSZWUDXahPVzVvl0wI+QEhsmOkARFeSHu6M/Y/foip5ThXVX2z3Vl4crnKI67hw696zxm6R/ORpr9hmDvuMZ+RfJqOe+yky/Os3kIex0heDT9PtETlDsoI1uyXIbYxuO88FzKY+rVAom46EZDX0kgAYXiAcWHzlFivPo97LodSSt1xyvmgYxoQB2KM9l417wuz3BVztAM9GUuUUOkBcmpK5WFhZPV+jW2b2D0rUy2w79jslMjzpdl6p9eiA4+v34YPDhoIg1FsrpVw5PSNhVni4jVVx+lbW/yyknZd62fk6kXyTevkZR2d2Xsjp6QtW1QeN5eoSeGP8+19dci4Ah/zqk9Vrjz223Pphn39nCU2LzR0xJe77sTsAyc=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUFKNlGu0jDKHWw4QjYAqRPYaJQNpKeKDAxb3dB6+Pi5KXw6IYR4uP4xnu44LtRzCmL6EseWV8gAohF/qCVlTsLyR4hmHD8tQwrrFtplXvMAoqrurUXjJG+UvtTxGjnA71NfuFvOCf92wnuIoS8OTITAPMWg4D5L+4zB0JFL9ua08psORCbs6djzWQSgK4Gu0AEkF0e3dfUTiBcqT63Ie1aqgXb4hL3wplexfJu28CdE036bnmh+e+aGPt0lUXEexTCahiD51Ue4wKg7vGEJuPYvPQbxSv7OXdg/JLHD7w5Js=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLOmet9P0g2X5hdzRuorUacUGx2/ZCFy6Ycgncz1P+YUPKkYH4nHFnSJst5B8fbYS9iG9mxM5nsF3GkIkyOyihTu+7tB1E1TOuw8nm9JPQx2pey6UbFDzGHw+UyMN1WJ2+BO2q6OCtGhcg2jn/emGJby5zqcqVm26UY9siaYfBuT6d8n0LrBRXDuxIMz9Fb8dHkw8YIysB7MqiF2HDNlPK71HHpFmLt2S0Rnm6PnUeBIw4L2CM91NThRUGgRH6Px/9R4bJ62eG1qGiG7c9dcb96+7s81/uvPsrf2e4POhPHkztXwZaSdmSt5jiZ/U9P92fP9MAdDTx8EiXR3ZYubTsBJmsqCuDErm7CQOuCVzUmTMxJilUiHhjyF8JFjVsHt0iwMfN83nGvuPCM7MvIoIx5hr7QyBylMQnwn3vMVT1XDE/fNWBA/NINZ1KECuOmeapd/RXtLIjT6kXMfbilTkqiSH6WWg2msGiPEC8noZWin2UIka4btTqi+nNQCojWYkQ+om5bJrByjqad7QXxiCcq6hkEZlUXORiip6pHrp+TFM=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVxczxM0oSCJxY42S/WWrw67uozq3Kw3eQ6hqv6ek0WmQJbdU+hQGu/mO/PHxADl+Yg==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmlX/1G4VEF8z4pOWdpqPPKEZpLXua7Laz/vu9gWWLySVgtgIPPBM/N87GKpq/tLveR+tHsZLJBE1z1yWlQSdu7+WdYKnrxNN5/5g3CdL2zC1MFx6Ce7cvpvI+jNnOpUXfzjK8coj8zGC7TlnW2XYZ1PWE44nN25FpaDBeJb/wlOXrpcmKhRVPYk8o6MURotB3g7hyJJuhS3CKHLbZeLCAbEQXZ1AiZAJZy4+ePjpofvg==</Encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQf1NZicuDqKoKHa3RSrMO80onetqKEDgDKQ5kiEtae4ICzZbhaJAcejANoe9OBk5ajmqH8gt2+Xz9ypSq6yS3hT5FcXXsdWFwcN9tdBTqXyiqPwmUesQP6QUiBE7Zbhj1jc2gCU1U82UdxXrElzsQ8E/4VkNINNEruwj+vY+IoByKVlkGuBLyqRImKvBApcnkv8mP9xV0Cz8bXZ+x3y0XyYVPWuq/G670NkpXMYUgLttbWdViDTQP9igjS5m25iNzycMp3bbCKqneKM+9ZbUnEFh8OwUcagACUn/ML8I0DzC3a/o6sFMLun4slt2oocm6Vs36sMPqTlyAKx8JPbGy81d9vZXEqFBr809mups2Yn</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>