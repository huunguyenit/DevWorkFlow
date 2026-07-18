<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="phdm" code="stt_rec" order="ma_sp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cấu trúc nguyên vật liệu" e="Product Structure"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" filterSource="Vacant" hidden="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="ma_sp" allowNulls="false">
      <header v="Sản phẩm" e="Product"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="treeView" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 453px;&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 453px;&quot; &gt;&lt;/div&gt;"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1000000: [stt_rec].Description"/>

      <item value="10000001: [treeView].Description, [treeView]"/>
    </view>
  </views>

  <commands>

    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNSKJPlSnGN9/aYKLcBiqn6WuICZCwAgZqVRG5fIk5pVjGS/gAYFnPDFa6Qv1QY2PJu+Gm76bqqMc8daNhheBRU=</Encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcK7cF9yRpLNkd6g2jvPnK4naezhrFFjmiChh1aXPnDxlkBvvLdXSy+pzyHMj08Ys8xLvzowSrcXAKytqunieK11Jyhzr7pazV3XarOvSK40E5s5bn0NiFZug+pcTh4e2Ww==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1ekby7cxiDSDXxpTysVxe2lXCdRh9f264TgThzXr03MubG/qoPT4ZGEfpj5EbZIbrM=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvMltMYJAr5vRWciqzex42UlRGvQoEob65LKrwwDSqY/nOJVYDm1fjKVk2UBM7Mrnqw=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTtVUrI/gsfA3r7kTKl+rm2I05M/oxR+2CvSB5xJQ7Tp9sOfVvWmpFV0MuHmZuXdZixEylY94lhKa3nPbyZudLpoGppfyDbKF1dMdIeTcoqwQOdHyRYXR1OD3nfek9wkq4CzwHYxoDpInb+pM3v7GZ+PAUwAzKxRaT7duq2smx05AK/3OWnz5RotJA+AjdoWrn2XG/gnmAH+if/TqWMbgOvPERJnWFl19i56lt0069oENx1rvHreYfdQ36Bffn4aSXV2lr8ZVFc2RWw28I8pdE+KjfpLC/utBHGoBa+lzfR+T7YNs8HUHoARkwb3/Q9f+h00BHn6Ty3i7+6Q344Gj2ncrfKDv3kOGFYJS2aXxC4HmbcfrgTGE50M/bDxtk+JMdG8EXj/NEy89x0WcVnC+hmWW/GSYQkPeBIs09wL+hOYYIWJEb9cPEvU9k8HoXCTEmUk1ptWt7aVp47YiBIBVu5/wwxfinkCdgdIe3RUl555GNbT0s9RN8m1GKWQh2gY0xANropEoWn+Hzc7jNnttE2i4DgPRbFRkfRVoKNXf5GM0A06c7FGONJNcOmCc/0THd0qBOe7vm2EphLm7tFRtKGqMdoVpOaF2PKCxXQ47nNsVUHRvLZQGg1Cjeb85zawIZb2Ydsw9BbCO3VgftiyGWr3x+fY4508LWm7aqUKlbE+q3w5x/ibaeWjmqm+j8EqZNJOP9T0/OWumP2mh87oykbaEtazqW0+mm2K6X0qTBS2mkyl2xIbO8oziGzWpyiy5egVz3QnIZ3mphC6GNFiTKNBw4Va+qe/52o8rFxpwhUGOU8adTRNyiQuJoxO717x5ssGScofjk1lO4lAVKMmIyFCxif0+sxbzVvJM8x8+6FAcQ/+8UvHExWKbUvCSiFo0jgOenbcV8HckgQroFQZMQCaaBWerY6Fc8mwCDuBILxjJ9LhGRycwYNEsxvagrcYYA8v+TMSfP5nCOY5qkNeVUvVnYPuAwo0OhqjyYTsgBGQ+cIXieUQwJPtvu2iMNolu8K+vAirErFHDdPSbGy8mJCY6Gg7MzBANw6Ao0IdggkA</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOoq7JQWl9avvdm3oDG5+XvhMXRh+9BcJI5Z7P7Ab+MLF</Encrypted>]]>
    </text>
  </css>
</dir>