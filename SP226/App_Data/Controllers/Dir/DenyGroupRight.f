<?xml version="1.0" encoding="utf-8"?>

<dir table="userinfo2" code="name, id" order="name, id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giới hạn truy cập cho nhóm người sử dụng" e="Access Right to User Groups"></title>
  <fields>
    <field name="name" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="@upperCaseFormat">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;"></footer>
      <items style="Mask"></items>
    </field>
    <field name="id" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="flag" external="true" defaultValue="0" allowContain="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="l1" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l2" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l3" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l4" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l5" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l6" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l7" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l8" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l9" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l10" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l11" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l12" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l13" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l14" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l15" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="10000111: [name].Description, [name], [id], [flag]"/>
      <item value="111111111111111: [l1], [l2], [l3], [l4], [l5], [l6], [l7], [l8], [l9], [l10], [l11], [l12], [l13], [l14], [l15]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/ckpAo0/H/URcTCmqyL6SELW2rrMvAvGar3RqvUzwXQkLEmS75PrZW5gYmlOkVIkT0BAagbOUlctCKmz7kQM8euR90xwKMn9acoHtJ/tfE0RTMHwg/W0nsIJI5IoZt++Q==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Zr2y5pKQTNobdB3ru1GxH9EOPDITmfqYvcXhQn8DwvK5aKcg2ZL4k2xOHhBpJkdIKprxdS+UGy+u07Fw+mfOPmdIRSc7g7/j4B80S9xKYUrQkpR4aihBEF42eqJB6ZHaZJCOwJy9Ug4e4zc2zPOIlxzukiaqBf/QTJZP66sbJzCOeAu2yZMj4v/4euGsECFXQ==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HwdSdd+5+qRrULzRJ4h8PlYaxd71HU72GrP4ApdfvtMvvNxeQ/aDBt3QE2f3fLTSV4=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JUGaBu1BDltEZQ7rukebSI14IcDFJs4ciCJD9gwVF7h2c9U0oYJyoHJ8fnavGvV6k9uyqL0ZDG/7Fi6l4d1GyBRtantngM0D3Uy7yyQ/QJJIxqEUVDf+fgf4E6m83nib4xkh3I4vKF7+4ePGvp8K+zKOPOaKhD99slwVAoyLpqrOh3gh3r6i1H/4QLfRGsJvuqrhGv8K1Mh//2jAuyhaEJR8M9qlOLUKOnYOC5J5+/V</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bnJgquUz9PQPCeJ900WZ1OV0iqryVmf2oyiN6xI8LOSOWeAS/Kl983jXdfm0Op53rww9art3oOl/LNOKRsmEuyDarSFOvMakPBO8guF6JJHZy7QJit2tXIZwuENj893clW68ykG0eXbJdmpnMdkTSoSvVWRTL16fNTwmtg0/TKa0rdQCF8dPwhegolAne65hwYKZiucJYe6Doywx8Z4jUH5dwg30nSPlDRTlEkZ38H4gms6J1m30K7MYUCuARa24oQqLf9r1oxJWkxMX59j6VFypqn1eU3qIB+TMm0tEat994D8LYcIANFGjJM7T4fWHw8ZYrR0hgjH9kqeuv1YzefUzr3RyNA6Tg3EWnHeIufHgXJbi8TNz9nkNRZKuF53waw+VfjCNsbMfHh4BTguBMeJqGLhb3/CBrmf2jIsdoXRwnX+nxdSrr5g1j16OI/tCHY84t+6AI/4WU2eOpdq8X932qbY6yaxdqmWinCLsIlgW1jWkOWjSrQ2W75hF2DF1uTEuqxtUtQe47ifA+y2x/97XLOjmMtvFWlC9vuj+BY/uh4Tt8EmzKf4C/e6q0j3iKMWPs2Wn6VPZ6mL5UJ1C0tHt2VPVqhAgDtWohVMu4B9IBummxDj4OmwWbZ1oskCAg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx2Qs+0tWXconatdmGK9nADg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjnwXMVEQgBgd1hTnmRmEdChMlcgxnA8QUcipcbMlLSSMEg7FuHKeDieyrPuG33HqAe8u9VyamYwEQf3Clamu8nwZASDwVtnwhMXAQS/4SGHSyPp4RNZrh1kS/M5+Rmyr/jwPR3oTkbJY/0TT3mKtasLg8FHxbBQ0oeKJNTjVIdMU7okxCmzHR6XKIcUiZRHwKV+QRSyCdlD2nNkItFwKeQMFnEjjZQISHNTPPyOa8bTp2/8NtedLujR0NY2wkWabuvXiBAeiQdZR4zjjHwyKna4/9s312qfopBUQi/mbKDDSfQAUXpgD6o6UWJm7+8P29PuU1GQH7u4sU3g2WBeOXK84KK5YYnbQHc1hSnzkICYS0BMph6C32uTk+PLiq/4Bqg4JK8/0fyK4qxzA3Y8OLT0JP/OrKoEXHZN6nh+J98rY/9TEdswdFCZ3CArLk67Pm/j4q5RpWUVFAY2XrB92zMAM/BiSHHhPGXL/arH1sh0GuHTflIxW3pGDy3tVqD4p91H2KWyGukIJ7L1duPTUbf/Z8TEK2HmTfyVpE1yVf3g1kV6jxU1GHHH1l0+URjl44FX3+Xtc7BYQtCjGJB1YhtmWq+0EE46JB3gCns7vp/thztm1mbf1GrwGrkGzgA8BpGoUALasEnQ8Qd5irJc/p6vhSasuBJHVV8yf/vgTKbfQnB/PwAL2ddq3ua4Dd9mTK3RmC4wkRMXhOmGsr3hFsqX</encrypted>]]>
    </text>
  </script>

</dir>