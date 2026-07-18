<?xml version="1.0" encoding="utf-8"?>

<dir table="hrnv" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền truy cập" e="Access Right"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" disabled="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" disabled="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="user_id = 0 and status = '1'" check="user_id = 0" information="ma_nv$vhrnv.ten"/>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="ho_nv + space(1) + ten_nv">
      <header v="" e=""></header>
    </field>
    <field name="name" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="admin = 0 and user_yn = 1 and status = '1'" check="admin = 0 and user_yn = 1" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bfi4HgkZjLxmlzqTtFv3COSL0bluolPPHtkZ1CcgC/crVRz8BtDB2erp38FVcYooq9ekpj5jQ42+SX7PAvxNbc=</Encrypted>]]></clientScript>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" type="Int32" hidden="true" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="name2" external="true" defaultValue="char(255)" hidden="true" disabled="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0, 0"/>
      <item value="111001: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="1110011: [name].Label, [name], [comment%l], [user_id], [name2]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+XQz6F1s/O0r19h8e4gbx9DjvM3331C6FHojffIUjYyY/42wGvtnAIVR8XuPN25YKF4X6WRTIg3yCksHdQ0inxvb8omgVmSptx+XwHwz89qRvLCNcCIY10LjiPytM+TAgJEJs9ksGxAzOoiVvAwPdfZX8yHJvHVqS7v49dzVGUhCQNobUDzM+rUIHx/ZZEJ8rCQBeOHODp/rMpZtqCI+f0a4uLc9LLBs36nwmFrRJvQuskhedYa/I3WcRpxpcGC25YWtOEg0+hcJV0LPz/WqbXgL95w//bU+ezLc4Isdt10CiCgmA4hg2Rny9QNPgiLnTs1uhbfGPp4rocKy4xGZHh4txfqH6xOX+agZlCV1l/x2oHRozQkRu1uVozGi9cRjg==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2GXVEW4+Qr3bPaP2H2ciTj77TVegm5mUz62UvScek8mbeL7y7s+/DrPZW7aF6QKY6FOnWAKJvWxdVU+lKzyZL6st/cxnmJPZ+2J0jcBlpc2hNE6+XvNx6amTjjjAZ5DmFj5seHyTwaJgfWLP+fxsMGAJZsrwDfaQ2D7y/olZ18PVbeHmxYv7ARFC5GEs1st/6NXbndYlQZlOE8SwXotf01aIMwv7CvPfp0Wh2eCJWMLw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHg1on1jsUtk31sgI4Rt8QWn4fDC9p8u+eNFVkSQgVSDVTdNaXK34sXalKsdzpFUKmVVtYViYs8Rxf7kY6Yhij6gZN5crC+pD0Ns6EpFBtgFq9xBv27HR6B6t1Hw6GMVqWVzaPMLgz0ruxOME7xzTf2mQ3H1Ogk5pD8O2Ieo+hVmZq4ies97sBM9prvh7bAmjF3SuN+xmZD7sbhvZuxR7cYmGnStUzApNkTBfAsP79o+R1a5h8EWtqhtml/jA/vkacETO8U6RqVr2r4JxOm6kq/HC4T4NyVTVXnyohlw5tJlA1r0C6bLvwDPsbtitPxXPy1+sAalfoElLYXC3uqwoUzJdyG71G+U8mtv7vRaRCwRtx5OVGFDy+hMs2Kh0+TUG4Yr71IfKhGdDfBmYQHKwjlw+evcJA4wawc9anoqTqAuNRd658xz5f7/aa4lEy+UMg==</Encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22azyhMOHniM7SyUBpkzuoSOEl3p6HRBcvWxB26BveH8IXkXdcsosK8vCx8iKtVU7cc+y5oKe5eNLMcnoCRo2QMc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdjLoBOXyMhzN63spgaV6lM+sZPD2E2+YzQfalX8Cusy0lu/gmz5Kzr9vF2eMy5Wdlgwz2llCU2WI5M/5NQFo2JfxQNhEP+MBR4fVWhJu/iNcrkzmcsZtuPWC9c3PtryvrfW6F8CNbr0RloVUwSMawjMKiXLOam7SDw2wwqX5Ibth0XmCS3hqvNC/SVvoxmK+3KHGeNqOTO1BnNXw2EzShOKAOjqwjty0BGp8aPg21Db</Encrypted>]]>
    </text>
  </script>
</dir>