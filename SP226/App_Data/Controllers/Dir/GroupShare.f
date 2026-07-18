<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="groupshare" code="id" order="id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm trao đổi, trò chuyện..." e="Chat Group"></title>
  <fields>
    <field name="id" isPrimaryKey="true" type="Int32" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nhom" dataFormatString="@upperCaseFormat" allowNulls="false" isPrimaryKey="true">
      <header v="Nhóm" e="Group"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_nhom" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="user_lst">
      <header v="Ds người sử dụng" e="User List"></header>
      <items style="Lookup" controller="UserGroup" key="status = '1' and user_yn = 1" check="user_yn = 1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ma_nhom].Label, [ma_nhom], [id]"/>
      <item value="1100000: [ten_nhom].Label, [ten_nhom]"/>
      <item value="1100000: [user_lst].Label, [user_lst]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI7+AIz0Ztb0iQ3XQACa0vIvlobFGLrPBJ2+TbBgIzBEPjFrWytf9zsJ7Hw+sPG20iWDt68QsQHVxs9Fu8tx3fYIE32nycRsfDY1Sw4cV/4lZ3heYjeipQUohaIFA1lAZFnfTzdDSVp2SQ7kEVv8ipydVlmNGGaq1nZw/TPeekX6NwacL9b/pAuaWJJM8BxKH4OH2icQ7LXGTTauiCjKmrEW1gGbidCbaihWR9tljkthOzNyebKDpYryzsJBhZ0HwI8x+U7DDqC/LoOqWkrM4LFMeDYz8OEiF/tUWz427J1hQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CX2F1dWkQKRK4lIvqAu9EumTynWP8xJFPPPotYMK2loNIacodcVlU4XfLdHffRWgCVX3KfW0M63cEghcB+Qzs72S0QhfwiMY/rcNLlaTOXNC08l2k2NalMDgOe/0CFCtnRah1pb3bfaIzT2oSShybmLRV5iFT7cwZf9WkGsmztS7C0J3qfRVNzcZH6a6i+mAp3qMrW+hQXmOGWNdKA2OY19jZu6fipwakSdd+oEllFwzuwPfBFmGQ3aKFQZQ+E0UQgu/Ex1sJNAkRAHHPJNKrNjZlyZpJyN2NV+T4pK9X95/ztmhlXvYPegXrAKaUJY7A</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aJY37GzVteQ+J3KJhn9LMA=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLGdDRM+tG2hRAGZfI35gAwpQ5nCDKna9EWt1kTmAbb8z4+sq+SxTm/UZ4VyBFCw99+xxMIYeR39ZuHmWnhVJgkYFcDOkapN+q5Om1e/EY+goH3omaCRF+3ueMjtrXZm4cM5OWDMxctSRqH6IFrBFzEmpDvrZ51zfQTV8nTenVXDF6tpGMMIg2d5i7yZREdIIKaFA9DFXTijKK6dcbfMtbo/qI5t4CFdlm4PAuaGh3gsoUzlDGCONwdhxC6nfrnzugiHYk06qkjvH5sLZRzjsQlg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVzpC4ldabi91hmhUGZD+N3/R6MGUEyne1W1VOoXyz3dk</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvztezs/Fo7XOM9mm8C6zZZ+gga+IH8antW5i+YiY26/lnYU3MURAgCpGr19EtI6jgL8JghY+RXmO5rw+4uHgnzUBbaGhE8YSG972Bniv14YCM40BXq7yvoDcp//muBrBnIlm</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAntCGM2aaUkiTAcABGLpJBWaXAtg5lBzTiS2ahA7h6qd0w+GL8yXlTPVHPt/PSsGOY5bpojYVE3/I/Lg9iMqikP4NlZ2YDCuE0tdBhsM2rz</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptIrregular;
    </text>
  </script>

</dir>