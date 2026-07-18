<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PSPhysical">
  <!ENTITY DetailTable "d68">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Return Goods to Supplier Number">
  <!ENTITY c31 "Ngày phiếu xuất">
  <!ENTITY c32 "Return Goods to Supplier Date">
]>

<dir table="m68$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu xuất trả lại nhà cung cấp thực tế" e="Return Goods to Supplier"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq98eEqcAgPAMwRxj3Dt8/CBIHzylPxlY/K2bG5isUcE44W4oby/1LSxdpRdV35qLyCFm93y4cS4i62NBMG3i2QsfDaP9V8eNbVHK5mI5GmMjDcnGlZ9cbnVlIVFshrMFL0yUZxhCgounoverN6W5t5ext82J5CjJEk2acmndshpVF9htZkjbgdRG9mm3RE1S26A7l3Y1oj0qPOMo6UEp/SJ7lsYaG4bTmWMgH5UpojpkB4ptrQzDxwi0qOtnWhQqvUSNWac5REjBkARItaYRWddIpQORVZWBdBisg/eZNF39tnFFhKiiFghM7p0H7tXDp90hTVgUefD3MlBbQcOb/heV3WuWEtgqGVmcAyZ5j5ZTHNJXYA8ndHF65e3q7acoSlpzp8WqqRyoPMwXV9esjZEWL/M4RPSzJUrFbt5zAfipDE7sav4CiTW/WY/qsGcUM6p3SIytOARZ5TWDnrj6HfT3pWxeLzG4y48hthnexuwX0=</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6FmAMVrLHk5yr5UPkCQ+Ji0LaOMUZKg0WLEv9wNowfFwjo1qCenNL4/WSpDcPaITiEKaMMJg1Ykn2hnKxgVjRox7RBJca7YQGBRQrhKoy7nuTgw2mn899n/bmbx+31vrIsow2wyQtuh3eHjZyiLDZpHs3VU5h6hnar8U6N6h0C0TDnHdbZbV5HcpX/M8bczY+MKXzsEeB28RoaO7eujZGGIxyWUiu+Kf7RAs2d+GAJV/nx0Qdw8AuOb/rEmKx27eBH8ao9yDEt8cwYMNgfpSxNK3wL7/NDT9RIKvrGPL8CsdlW1LOpXl9IPPVslfvILgIgy5bUpCM2Q26z/l1TUcP7TCk/Be08H8R4OkgbzOKOeOE15juHB9HfXZ1st/3FdHmtYjbAHl0xljQjMrlJaVkBLrtl8ZDp+8IFwSYgS9QxYKh+MuRwNdTBFsXxfG0Md7bcFVdTEJV+/SBXJKZACAFtX/3SWg2yehRIDTXEtjx8keMK2+7A1kIE1C+fx6AJBFcnn6qPFcmnjl446DZm6jd5Ssl5v/b/+tUtDgB3Wigo5RvcMqF2X6QiHTClMsQw0enYkamRHa/Cfym4BcXkzx/tSMk7c10Kjk4ZyYLmy3lmZSRYRX5HvLHjZ342Y5aJRuZvDaRViVRpipTGXWBMAgS85uQxPGr54CjsPpIhTioED7hIGyP095Ks9qf2GkHHLsXTzdRQ7kN1KKL8LvQub6NPHq2noxUek1si+wmrP03EG4UPk7eUMwa/iot5bis+8RFjwOlJLwC65IiLNRaH0O40bc0n4XVeUSkoBgZaC3OZze9Q5imMoOaQisRY6wV4NgKaHty94kaOqszHDc9wvQfxedfgcr2g4rSmEcUUmYwF0MUk2kdmQEHwkpT6VLuH1YlDbgkbYPn5c/0cZ5WMEXjiSnL9g6Ig02P40zDM5cRxeKG3sE4K3oLbpzfcVjyp7k6PKkWIcJ1dZ6TnsybB/4MGKm6Li7CinNUfcwXg/Zqbdajvr0FNxVW/ZLPBKHJHh+RopTORInGmgBHy86XEY1XxS9YzmEm/baV2h/yQHhLbXgCs1kFBqVpkUXohbQvh174L1r1B/cdFOjvZXGpLeOU6PKSSL9JXoobhPU97QLYvTY9E9CxMRNYVskHpZI07V5zdCO/5YujL4rp2uXaDLYJYPcYHIjv1qGx5MxCin3lJsvHMLq0I0CZfQ9f6D7EU4UGA==</Encrypted>]]>
    </text>
  </script>
</dir>