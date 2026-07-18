<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY TransferID "ManagementObjectGroup3">

  <!ENTITY % ManagementObjectName SYSTEM "..\Include\ManagementObjectName.ent">
  %ManagementObjectName;
]>

<dir table="dmnhdtqt3" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm &Name.Title3.v;" e="&Name.Title3.e; Group"></title>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" allowNulls="false" align="right">
      <header v="Loại nhóm" e="Group Type"></header>
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type: 1, 2 or 3"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"></header>
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
      <item value="1110: [loai_nh].Label, [loai_nh], [loai_nh].Description"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdqmn275oJpJ4vjI6yXBNmt53HOUPRQXzfP97G9ooeGa4nGskGaQ4Gsq9owho27NGQw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdqmn275oJpJ4vjI6yXBNmt53HOUPRQXzfP97G9ooeGa4nGskGaQ4Gsq9owho27NGQw==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIwQBx5CH/ttdc6QCsDIQN2+RexuzPESTSxupxoA42KhCBYcYjUL8uqbgytkZEt3Esc5mdjtc/NS+IxbMKFBl6imH6hFzd30vNmtvPq2guY14WipaSepDKJJLyjm1PQ1mCLpGPutR6tvfNAm7j1jc9T83Z9H1meyf4zWIvOgFjiqQ=</Encrypted>]]>&Name.Field3.Text.v;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz5uDZcYSkZ7VS35blaRnOS3D3BEZgUN3cqZ42gwm9lUWsvHsi8HTu72dsWxZJz1BQ4akitdFMIzdosHSQrKidAwlHXbzWs+RKGkG/MFhQjBG0uXvGvMUXAYPigIoMHRR4V6KJRd9TajCkFLcqv8GI9BHJY2/+GgOnL7k40tjd2b2loPQzeJKVCBM1XIxfTQE+RdIYeNDOoFKh0a13tk07Odxw0a0o9mi1qT0gZH1n/qmPCxSXkRWXBdVtDu9KOMpA4dpYOeS+0cx9+weksxGdcL3bGvTEhIvicbstfhiymprFgye05P/OT+Q1KwGVHpaACvkCwGYnEvP2UtI5bfFqgACMjPmsum6jrBLcZdeZzKQmqLHsiD4evpP9u2+uvWbTux/bKAnxNoby5ExXsfKAP8=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUflKqaj11Hj5uUkG/x4ySEHaHgA0GPfcmJsd3OCVELjzxplVQRBEIWAUxHlv4wxLImE3WwC0XiBFxEAP5tEn7XeaBurNkIHdi1AMFwI70YFnB5GKMX5c7ADAU2GbqBww/Zt58kCG42zD66r0PxzfwQFXEMP5Nw/z//bkemyxuSZCPEh2/ElYtS9mOn13wrvpcOrGDI9DafrqkDSmCx65aPBwP7z5hExZgbPw9WXY1shGduebNgW1nBsRUiIMqr/A9</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLzCXsGfRIMSQEqkTIpT2fIf835AFAHtCjIJMx75eUOghf+lwkB9oY7YQfOjCpdXozzih5ohPJvXIKXFKGxTA9DAxSsz7xowZCu6pd0g4J/lFfxMMk/LLorRcUilc8eZlGOlw4e9/uOkkXT0knjzde5zG/jxApGhZb/Y905EcFmP5LPHiem6HB14WGKpM5k3DDGUvsa7yxCPU/AXLFIEZzQb6mxGjKR+/QbApGHGRlfs8/G3fxT+q7ytE0aI3F9O0r02GZQVW3iOWLCZzSn1keP2i8ESH0wY3DK7bBNOdr1xhNRFcvaxgBwXVyAjnnI3Kl</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV3poIlJGhLPmEzCJTJmiiJ+1yoz+aB/LgZ7Ol0oyxww9mxwmKt5hAnj3t3WzBCPcrw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxduBYmTDrSj8+4Vl4uJMvPrT9rh1wzkVpcEhQDePinqUwZV2DuilQO9KUNTq7EeOiEw==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKrx/Nb++/xtYJnijLNVb6mpldOvGKHJrlvzuoXu0oVvxg==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdibVmmGRIg6Du8S9EUfKOx277+PeP6TmXE85E4H1qEW5DvHGp+vwMQphDtC42bEBwrEyBBcRU5UBYbtO5kYV+lE=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKo3v+E4hRortekDPKQydNNmT4BfYsG2FLwYc++SizkbrGlIhkvFcSk4zc2Lq9M2SDE=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKoYlLk8sujKrFS0zvehuCqqPa7XVEGM9OswUgoRlF5RmnrXZRqC/o9XGg1c6GO23Fs9XFfUbrNWAXEt93/e0xYdmwQyuT//1h3yQwzjt8Vgu+KpvUHckmcIIDrBO6qB69j6WhXaLiShLg0vBBQG6TXcPoWs0em/etzvCOSxlC1/oMuSGNe2DkMG95ulAsvG4FiBU5IuCa5pGOn1/BqBZNxaX09pD4bSyoErNgEFFv5Qag==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>